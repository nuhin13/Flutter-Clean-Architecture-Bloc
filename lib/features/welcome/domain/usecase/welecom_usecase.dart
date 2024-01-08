import 'package:flutter_clean_architecture/core/data/cache/base_cache.dart';
import 'package:flutter_clean_architecture/core/data/cache/preference/shared_preference_constants.dart';
import 'package:flutter_clean_architecture/core/domain/service_locator.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/repository/welcome_repository.dart';

class WelcomeUseCase implements WelcomeRepository {

  @override
  Future<bool> isUserLoggedIn() async {
    String? session = await serviceLocator.get<BaseCache>().get(SharedPreferenceConstant.session);

    if(session == null) {
      return Future.value(false);
    }

    return Future.value(true);
  }
}