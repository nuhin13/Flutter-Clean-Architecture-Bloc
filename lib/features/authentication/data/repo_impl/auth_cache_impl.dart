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
    Either<Failure, UserInfo> trades = await authHttpImpl.emailLogin(req);

    if (trades.isRight()) {
      UserInfo? tradeList = trades.fold((l) => null, (r) => r);
      cache.put(SharedPreferenceConstant.jwt, tradeList!.accessToken, const Duration(days: 1));
      cache.put(SharedPreferenceConstant.refreshToken, tradeList.refreshToken, const Duration(days: 1));
      cache.forever(SharedPreferenceConstant.session, DateTime.now().toString());
    }

    return trades;
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
    // TODO: implement registration
    throw UnimplementedError();
  }
}