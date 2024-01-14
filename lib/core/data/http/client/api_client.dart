import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/user_info.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:logger/logger.dart';

import '../../../../services/navigation/navigation_service.dart';
import '../../../domain/error/api_exceptions.dart';
import '../../cache/client/base_cache.dart';
import '../../cache/preference/shared_preference_constants.dart';
import '../../dto/jwt.dart';
import 'api_client_config.dart';
import 'resource.dart';

Dio _dio = Dio();

enum _TokenizeRequest {
  withoutAnyToken,
  withValidToken,
  withCurrentToken,
}

class ApiClient {
  final ApiClientConfig _config;
  final BaseCache _cache;

  JWT? _token;
  Future? _ongoingRefreshCall;
  bool isRefresh = false;
  Logger _logger;

  ApiClient(this._config, this._cache, this._logger) {
    setToken();
  }

  ApiClientConfig get config => _config;

  bool hasToken() {
    return _token != null;
  }

  Future<void> setToken() async {
    var userInfo = await _cache.get(SharedPreferenceConstant.customerInfo);

    if (userInfo != null) {
      UserInfo info = UserInfo.fromJsonString(userInfo);
      _token = JWT(info.accessToken, info.refreshToken ?? "No refresh token");
    }
  }

  JWT? getToken() {
    return _token;
  }

  get logger => _logger;

  set logger(value) {
    _logger = value;
  }

  void removeToken() {
    _token = null;

    _cache.flushAll().then((value) {
      NavigationService.logoutAndNavigateToLoginScreen();
    });
    //Dispatcher.fire(LoggedOutEvent());
  }

  Future<Resource> get(String uri, {Map<String, dynamic>? queryParams}) async {
    return _get(uri, false, queryParams);
  }

  Future<Resource> authorizedGet(String uri,
      {Map<String, dynamic>? queryParams}) async {
    return _handleAuthorizationError(() {
      return _get(uri, true, queryParams);
    });
  }

  Future<Resource> post(String uri, Map<String, dynamic> data) async {
    return _post(uri, false, data);
  }

  Future<Resource> authorizedPost(String uri, Map<String, dynamic> data,
      {bool? isFormData = false}) async {
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

  Future<Resource> _get(
      String uri, bool tokenize, Map<String, dynamic>? queryParams) async {
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

  Future<Resource> _post(String uri, bool tokenize, Map<String, dynamic>? data,
      {bool? isFormData}) async {
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

  Future<Resource> _handleAuthorizationError(Function func,
      {int retry = 1}) async {
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

  Future<Resource> _getDataOrHandleDioError(Function func,
      {int retry = 1}) async {
    try {
      final Response response = await func();
      _logIfDebug(response);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Resource(
            response: response.data, messageCode: response.statusCode);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException(
            response.data['message'] ?? "unauthorized exception");
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
            message:
                response.data != null ? response.data['message'] : 'failed');
      }
    } on DioException catch (error) {
      logger.wtf(error, error.message, StackTrace.current);
      if (error.type == DioExceptionType.sendTimeout) {
        throw Exception("Connection timeout exception");
      }
      if (error.type == DioExceptionType.connectionError) {
        throw const SocketException("no internet");
      }
      if (error.response == null) {
        throw RepositoryUnavailableException(error.message);
      }
      return Resource(
        status: ResourceStatus.failed,
        message: error.message,
        response: error.response,
      );
    }
  }

  void _logIfDebug(Response response) {
    if (_config.isNotDebug) return;

    logger.d(response.realUri.toString());
    logger.d(response.data);
    logger.d(response.statusCode.toString());
  }

  String _getErrorMessage(Response response) {
    String message = response.data['message'];
    return message;
  }

  String _makeUrl(String uri) {
    return uri;
  }

  Future<Options> _makeOptions(bool tokenize) async {
    var version = await _cache.get(SharedPreferenceConstant.version);
    var headers = generateHeader(version: version);

    if (tokenize) {
      headers = await _addAuthHeader(headers);
    }
    return Options(
        headers: headers,
        sendTimeout: const Duration(milliseconds: 60 * 1000),
        receiveTimeout: const Duration(milliseconds: 30 * 1000),
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
                  NavigationService.navigatorKey.currentContext!) ==
              const Locale('ja')
          ? "jp"
          : "en",
      "Version": version,
    };
    return header;
  }

  Future<Map<String, dynamic>> _addAuthHeader(
      Map<String, dynamic> headers) async {
    JWT? token = await _getToken();
    headers["authorization"] = "Bearer ${token.getToken()}";
    return headers;
  }

  Future<JWT> _getToken() async {
    if (_token == null) throw ArgumentError.notNull("Token");
    // if (tokenize == _TokenizeRequest.withCurrentToken) return _token!;
    //if (_token!.isAlive()) return _token!;

    return _token!;

    await _refreshToken();
    return _token!;
  }

  Future<void> _refreshToken() async {
    try {
      await _handleAuthorizationError(() async {
        _ongoingRefreshCall ??= _post('/refresh_token', false, {});
        var response = await _ongoingRefreshCall;
        _ongoingRefreshCall = null;
        // _token = JWT(response['token']);
        //Dispatcher.fire(TokenUpdatedEvent(_token!));
        return response;
      }, retry: 0);
    } on UnauthorizedException {
      removeToken();
      rethrow;
    }
  }
}

//
// Future<Options> _makeOptions(_TokenizeRequest tokenize) async {
//   var headers = {
//     'Accept': ContentType.json.mimeType,
//     'X-App-Version': (await PackageInfo.fromPlatform()).buildNumber,
//     'X-App-Platform': Platform.isIOS ? "iOS" : "android"
//   };
//
//   if (tokenize == _TokenizeRequest.withoutAnyToken) return Options(headers: headers);
//   headers = await _addAuthHeader(headers, tokenize);
//   return Options(headers: headers);
// }
//
// Future<Map<String, String>> _addAuthHeader(Map<String, String> headers, _TokenizeRequest tokenize) async {
//   var token = await _getToken(tokenize);
//   headers["authorization"] = "Bearer ${token.toString()}";
//   return headers;
// }
//
// Future<JWT> _getToken(_TokenizeRequest tokenize) async {
//   if (_token == null) throw ArgumentError.notNull("Token");
//   if (tokenize == _TokenizeRequest.withCurrentToken) return _token!;
//   if (_token!.isAlive()) return _token!;
//
//   await _refreshToken();
//   return _token!;
// }
//
// Future<void> _refreshToken() async {
//   try {
//     await _handleAuthorizationError(() async {
//       _ongoingRefreshCall ??= _post('/api/customer/refresh?token=true', _TokenizeRequest.withCurrentToken, {});
//       var response = await _ongoingRefreshCall;
//       _ongoingRefreshCall = null;
//       _token = JWT(response['token']);
//       //Dispatcher.fire(TokenUpdatedEvent(_token!));
//       return response;
//     }, retry: 0);
//   } on UnauthorizedException {
//     removeToken();
//     rethrow;
//   }
// }
