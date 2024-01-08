import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

import '../../../routes/navigation_service.dart';
import '../../domain/error/api_exceptions.dart';
import '../cache/base_cache.dart';
import '../cache/preference/shared_preference_constants.dart';
import 'api_client_config.dart';
import 'resource.dart';

Dio _dio = Dio();

class ApiClient {
  final ApiClientConfig _config;
  var _logger;

  get logger => _logger;

  set logger(value) {
    _logger = value;
  }

  // String? _token;

  final BaseCache _cache;
  Future? _ongoingRefreshCall;
  bool isRefresh = false;

  ApiClient(this._config, this._cache, this._logger);

  ApiClientConfig get config => _config;

  void removeToken() {
    _cache.flushAll().then((value) {
      NavigationService.logoutAndNavigateToLoginScreen();
    });
  }

  Future<Resource> get(String uri, {Map<String, dynamic>? queryParams}) async {
    return _get(uri, false, queryParams);
  }

  Future<Resource> authorizedGet(String uri, {Map<String, dynamic>? queryParams}) async {
    return _handleAuthorizationError(() {
      return _get(uri, true, queryParams);
    });
  }

  Future<Resource> post(String uri, Map<String, dynamic> data) async {
    return _post(uri, false, data);
  }

  Future<Resource> authorizedPost(String uri, Map<String, dynamic> data, {bool? isFormData = false}) async {
    return _handleAuthorizationError(() {
      return _post(uri, true, data, isFormData: isFormData);
    });
  }

  Future<Resource> authorizedPut(String uri, Map<String, dynamic> data) async {
    return _handleAuthorizationError(() {
      return _getDataOrHandleDioError(() async {
        Options options = await _makeOptions(true);
        return _dio.put(
          _makeUrl(uri),
          data: data,
          options: options,
        );
      });
    });
  }

  Future<Resource> delete(String uri) async {
    return _delete(uri, false);
  }

  Future<Resource> authorizedDelete(String uri) async {
    return _handleAuthorizationError(() {
      return _delete(uri, true);
    });
  }

  Future<Resource> _get(String uri, bool tokenize, Map<String, dynamic>? queryParams) async {
    return _getDataOrHandleDioError(() async {
      Options options = await _makeOptions(tokenize);
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ));
      String url = _makeUrl(uri);
      return _dio.get(
        url,
        queryParameters: queryParams,
        options: options,
      );
    });
  }

  Future<Resource> _post(String uri, bool tokenize, Map<String, dynamic>? data, {bool? isFormData}) async {
    bool hasFile = data != null ? _processFiles(data) : false;

    logger.d("Data: $data");

    return _getDataOrHandleDioError(() async {
      Options options = await _makeOptions(tokenize);
      return _dio.post(
        _makeUrl(uri),
        data: hasFile
            ? FormData.fromMap(data)
            : isFormData == true
                ? FormData.fromMap(data!)
                : data,
        options: options,
      );
    });
  }

  Future<Resource> _delete(String uri, bool tokenize) async {
    return _getDataOrHandleDioError(() async {
      Options options = await _makeOptions(tokenize);
      return _dio.delete(
        _makeUrl(uri),
        options: options,
      );
    });
  }

  bool _processFiles(Map<String, dynamic> data) {
    bool hasFile = false;
    for (var key in data.keys) {
      if (data[key] is File) {
        File file = data[key];
        data[key] = MultipartFile.fromFileSync(file.path);
        hasFile = true;
      }
    }
    return hasFile;
  }

  Future<Resource> _handleAuthorizationError(Function func, {int retry = 1}) async {
    try {
      return await func();
    } on ApiException catch (e) {
      debugPrint('=================');
      if (e.code != 401) rethrow;
      if (retry <= 0) throw UnauthorizedException(e.message);
      // await _refreshToken();
      return _handleAuthorizationError(func, retry: --retry);
    }
  }

  Future<Resource> _getDataOrHandleDioError(Function func, {int retry = 1}) async {
    try {
      final Response response = await func();
      _logIfDebug(response);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Resource(response: response.data, messageCode: response.statusCode);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException(response.data['message'] ?? "unauthorized exception");
      } else if (response.statusCode == 403) {
        throw UnauthorizedException("unauthorized exception");
      } else if (response.statusCode == 500) {
        return Resource(
            response: response.data ?? {"message": "Internal Server Error"},
            message: 'Internal Server Error',
            messageCode: 500);
      } else {
        return Resource(
            status: ResourceStatus.failed,
            messageCode: response.statusCode,
            message: response.data != null ? response.data['message'] : 'failed');
      }
    } on DioError catch (error) {
      logger.wtf(error, error.message, StackTrace.current);
      if (error.type == DioErrorType.sendTimeout) {
        throw Exception("Connection timeout exception");
      }
      if (error.type == DioErrorType.connectionError) {
        // check
        throw const SocketException("no internet");
      }
      if (error.response == null) {
        throw RepositoryUnavailableException(error.message);
      }
      return Resource(
        status: ResourceStatus.failed,
        message: error.message, //error.error ?? error.toString(),
        response: error.response,
      );
    }
  }

  void _logIfDebug(Response response) {
    if (_config.isNotDebug) return;

    logger.d(
      response.realUri.toString(),
    );
    logger.d(
      response.data,
    );
    logger.d(
      response.statusCode.toString(),
    );
  }

  String _getErrorMessage(Response response) {
    String message = response.data['message'];
    return message;
  }

  String _makeUrl(String uri) {
    return uri;
    // if (uri.startsWith(_config.accountKitBaseUrl) ||
    //     uri.startsWith(_config.accountBaseUrl) ||
    //     uri.startsWith(_config.accountAuthBaseUrl)) {
    //   return uri;
    // } else if (uri.startsWith(Urls.baseUrl)) {
    //   return uri;
    // }

    // return '${_config.baseUrl.trimChar('/')}/${uri.trimChar('/')}';
  }

  Future<Options> _makeOptions(bool tokenize) async {
    var version = await _cache.get(SharedPreferenceConstant.version);
    var headers = generateHeader(version: version);

    if (tokenize) {
      headers = await _addAuthHeader(headers);
    }
    return Options(
        headers: headers,
        sendTimeout: const Duration(milliseconds: 60 * 1000), // 60 * 1000
        receiveTimeout: const Duration(milliseconds: 30 * 1000), // 30000
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        });
  }

  Map<String, dynamic> generateHeader({String? version}) {
    var header = {
      "Accept": "application/json",
      "Platform": Platform.isIOS ? "ios" : "android",
      "Accept-language": Localizations.localeOf(
          NavigationService.navigatorKey.currentContext!) == const Locale('ja')
          ? "jp" : "en",
      "Version": version,
      // 'portal-name': _config.portal-nametalName,
      // 'user-id': "",
      // 'User-Agent': _config.systemInfo,
      // 'version-code': _config.versionCode,
    };
    return header;
  }

  Future<Map<String, dynamic>> _addAuthHeader(Map<String, dynamic> headers) async {
    String? token = await _getToken();
    headers["authorization"] = "Bearer $token";
    return headers;
  }

  Future<String?> _getToken() async {

    return "tJbL0xNamTon7yLt_6_FXtaFWhRQKupAtvurmb2nZRX5iwgSQmyJYmPDXVxpK4JpZdUEfDM1lXOmskvHd8YyG-WyYQik4Bpd5N6P_pMKSyGBbDe8Sv1Ek4iHZN0dw3-Y8AvmOoiFBXpj_md_DHtJbtLw71hlr9HQuB0FstIVFVXUPvQM597iyBdlPWbAYphj15CdUH9NorDHs3SI7OiYfSROnnXIGGcLJqQJQ9UFd96Q8PFKGNltU3uP_7FvTpcA9erNjQt6Wo7IfVglRuJOBHKkTjUieduz5Aw7EKhw-IH_3u4m4Hzdol08H530iH7kUeiOwvxwPRNczGA1CJ8WMpgLbhgm3j8mm204gmOBgoKgoValQ07p0-vJtfFwzX1ms56oAUkZwQtjhHRACp1MGxa2bYuHPzoCZKbj9A6TVzqVcjGLr_fjpGD5y8sx8ebApMvx8j4LGIgrgTDAwKI5gpAW6HUtT1Ta66Mk4mrX7E7a_vHuq-IXujb1YdInhzSTzzbG6CGBiEoqRmdKmjiL5nqhRz03ls4K2zt56wfgfj5o04pJotmR1Lx-Rg34dg95F5Cnsii1E0My13iHgcvO5uVpm2uMjR9Ykqpybi6metOol9UaufODf2mTR_QQ82zRGBfkaDi9SRKGxpoILpZp_SIQXrf-8bGBWZtpOpHLerPb-XyF0shdBYNKbJfbOOccrV2wOxnyQBhrdkvHSa6nCGLKR2YSt3QLu7AfXgyIxts";
    String? token;
    if (isRefresh) {
      token = await _cache.get(SharedPreferenceConstant.refreshToken);
    } else {
      token = await _cache.get(SharedPreferenceConstant.jwt);
    }
    if (token == null) throw ArgumentError.notNull("Token");
    return token;
  }
}
