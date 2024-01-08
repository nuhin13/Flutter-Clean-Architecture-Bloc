import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/data/cache/base_cache.dart';
import 'package:flutter_clean_architecture/core/data/cache/base_cache_repository.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/auth_login_req.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/model/user_info.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/data/cache/preference/shared_preference_constants.dart';
import 'auth_http_impl.dart';

class AuthCacheImpl extends BaseCacheRepository implements AuthRepository {

  final AuthHttpImpl authHttpImpl;

  AuthCacheImpl(BaseCache cache, this.authHttpImpl) : super(cache);


  @override
  Future<Either<dynamic, UserInfo>> login(AuthLoginReq req) async {
    Either<dynamic, UserInfo> trades = await authHttpImpl.login(req);

    if (trades.isRight()) {
      UserInfo? tradeList = trades.fold((l) => null, (r) => r);
      cache.put(SharedPreferenceConstant.jwt, tradeList!.accessToken, const Duration(days: 1));
      cache.put(SharedPreferenceConstant.refreshToken, tradeList.refreshToken, const Duration(days: 1));
      cache.forever(SharedPreferenceConstant.session, DateTime.now().toString());
    }

    return trades;
  }
}