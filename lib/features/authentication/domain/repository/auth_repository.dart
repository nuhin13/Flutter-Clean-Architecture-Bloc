import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/auth_login_req.dart';

import '../model/user_info.dart';

abstract class AuthRepository {
  Future<Either<dynamic, UserInfo>> login(AuthLoginReq req);
}
