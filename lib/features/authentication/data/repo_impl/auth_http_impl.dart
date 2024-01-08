import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/data/http/base_http_repository.dart';
import 'package:flutter_clean_architecture/core/domain/service_locator.dart';

import '../../../../core/data/cache/base_cache.dart';
import '../../../../core/data/http/api_client.dart';
import '../../../../core/data/http/api_urls.dart';
import '../../../../core/domain/failure.dart';
import '../../domain/model/auth_login_req.dart';
import '../../domain/model/user_info.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/auth_login_response.dart';

class AuthHttpImpl extends BaseHttpRepository implements AuthRepository {
  late final ApiClient _client;

  AuthHttpImpl(this._client) : super(_client);

  @override
  Future<Either<dynamic, UserInfo>> login(AuthLoginReq req) async {
    try {
      final response = await _client.post(ApiUrl.login, req.toJson());
      if (response.messageCode == 200) {
        AuthLoginResponse authResponse =
            AuthLoginResponse.fromJson(response.response);

        return Right(UserInfo(
          userName: authResponse.userName ?? "",
          fullName: authResponse.fullName ?? "",
          ogName: authResponse.organizationName ?? "",
          isSupperAdmin: authResponse.isSuperAdmin ?? "false",
          accessToken: authResponse.accessToken ?? "",
          refreshToken: authResponse.refreshToken ?? ""
        ));
      } else {
        return const Left(ConnectionFailure("response.data['message']"));
      }
    } catch (e) {
      throw Future.error(e);
    }
  }
}
