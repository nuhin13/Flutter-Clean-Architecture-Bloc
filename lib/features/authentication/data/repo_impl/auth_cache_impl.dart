import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/auth_facebook_req.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/auth_gmail_req.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/auth_reg_req.dart';
import '../../../../core/data/cache/base_cache.dart';
import '../../../../core/data/cache/base_cache_repository.dart';
import '../../../../core/data/cache/preference/shared_preference_constants.dart';
import '../../../../core/domain/failure.dart';
import '../../domain/model/auth_login_req.dart';
import '../../domain/model/user_info.dart';
import '../../domain/repository/auth_repository.dart';
import 'auth_http_impl.dart';

class AuthCacheImpl extends BaseCacheRepository implements AuthRepository {
  final AuthHttpImpl authHttpImpl;

  AuthCacheImpl(BaseCache cache, this.authHttpImpl) : super(cache);

  @override
  Future<Either<Failure, UserInfo>> emailLogin(AuthLoginReq req) async {
    Either<Failure, UserInfo> user = await authHttpImpl.emailLogin(req);

    if (user.isRight()) {
      UserInfo? tradeList = user.fold((l) => null, (r) => r);
      await cache.forever(
          SharedPreferenceConstant.customerInfo, tradeList!.toJsonString());

      await authHttpImpl.jwtUpdated();
    }

    return user;
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
    await authHttpImpl.jwtUpdated();
  }
}
