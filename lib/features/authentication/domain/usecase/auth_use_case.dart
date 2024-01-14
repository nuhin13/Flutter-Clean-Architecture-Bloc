import 'package:dartz/dartz.dart';

import '../../../../core/core_export.dart';
import '../model/auth_facebook_req.dart';
import '../model/auth_gmail_req.dart';
import '../model/auth_login_req.dart';
import '../model/auth_reg_req.dart';
import '../model/user_info.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> doLogin(AuthLoginReq params) async {
    Either<Failure, UserInfo?> useInfo = await _authRepository.emailLogin(params);

    return useInfo.fold(
        (l) => Left(l), (r) => Right((r != null) ? true : false));
  }

  Future<Either<Failure, bool>> doRegister(AuthRegistrationReq params) {
    throw UnimplementedError();
  }

  Future<Either<Failure, bool>> doGmailLogin(AuthGmailReq params) {
    throw UnimplementedError();
  }

  Future<Either<Failure, bool>> doFacebookLogin(AuthFacebookReq params) {
    throw UnimplementedError();
  }

}
