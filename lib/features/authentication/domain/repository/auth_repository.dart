import 'package:dartz/dartz.dart';
import '../../../../core/core_export.dart';
import '../model/auth_facebook_req.dart';
import '../model/auth_gmail_req.dart';
import '../model/auth_login_req.dart';
import '../model/auth_reg_req.dart';
import '../model/user_info.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserInfo>> emailLogin(AuthLoginReq req);

  // Dummy Have to implement when real api is ready
  Future<Either<dynamic, dynamic>> registration(AuthRegistrationReq req);

  Future<Either<dynamic, dynamic>> gmailLogin(AuthGmailReq req);

  Future<Either<dynamic, dynamic>> facebookLogin(AuthFacebookReq req);

  Future<void> jwtUpdated();
}
