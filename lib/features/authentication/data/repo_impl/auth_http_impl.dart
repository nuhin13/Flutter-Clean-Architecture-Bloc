import 'package:dartz/dartz.dart';

import '../../../../core/core_export.dart';
import '../../domain/model/auth_facebook_req.dart';
import '../../domain/model/auth_gmail_req.dart';
import '../../domain/model/auth_login_req.dart';
import '../../domain/model/auth_reg_req.dart';
import '../../domain/model/user_info.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/auth_login_response.dart';

class AuthHttpImpl extends BaseHttpRepository implements AuthRepository {
  late final ApiClient _client;
  late final AuthenticationApiUrls _urls;

  AuthHttpImpl(this._client, this._urls) : super(_client);

  @override
  Future<Either<Failure, UserInfo>> emailLogin(AuthLoginReq req) async {
    try {
      final response = await _client.post(_urls.emailLoginUrl, req.toJson());
      if (response.messageCode == 200) {
        AuthLoginResponse authResponse =
            AuthLoginResponse.fromJson(response.response);

        return Right(UserInfo(
            userName: authResponse.userName ?? "",
            fullName: authResponse.fullName ?? "",
            ogrName: authResponse.organizationName ?? "",
            role: authResponse.isSuperAdmin ?? "admin",
            accessToken: authResponse.accessToken ?? "",
            refreshToken: authResponse.refreshToken ?? ""));
      } else {
        return const Left(ConnectionFailure("response.data['message']"));
      }
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<Either> facebookLogin(AuthFacebookReq req) {
    throw UnimplementedError();
  }

  @override
  Future<Either> gmailLogin(AuthGmailReq req) {
    throw UnimplementedError();
  }

  @override
  Future<Either> registration(AuthRegistrationReq req) {
    throw UnimplementedError();
  }

  @override
  Future<void> jwtUpdated() async {
    await _client.setToken();
  }
}
