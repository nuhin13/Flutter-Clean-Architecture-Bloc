import 'package:flutter_clean_architecture/features/authentication/data/repo_impl/auth_cache_impl.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/usecase/auth_use_case.dart';
import 'package:flutter_clean_architecture/features/welcome/data/repo_impl/welcome_repository_impl.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/repository/welcome_repository.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/usecase/welecome_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../../app/app_config.dart';
import '../../features/authentication/data/repo_impl/auth_http_impl.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/trades/data/cache/trade_cache_impl.dart';
import '../../features/trades/data/http/trade_http_impl.dart';
import '../../features/trades/domain/repo/trade_repository.dart';
import '../data/cache/base_cache.dart';
import '../data/cache/preference_cache.dart';
import '../data/http/api_client.dart';
import '../data/http/api_client_config.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  init({required AppConfig appConfig}) {
    // Base Register
    _baseRegister();

    // Register Repositories
    _registerRepositories();
  }

  _baseRegister() {
    registerSingleton<AppConfig>(appConfig);

    registerFactory<ApiClientConfig>(() =>
        ApiClientConfig(
          baseUrl: appConfig.apiBaseUrl,
          isDebug: appConfig.debug,
          apiVersion: appConfig.apiVersion,
        ));

    registerFactory<ApiClient>(
            () =>
            ApiClient(
                get<ApiClientConfig>(), get<BaseCache>(),
                Logger()));

    registerFactory<BaseCache>(() => PreferenceCache());
  }

  _registerRepositories() {
    // Register Repository with cache
    _registerRepoWithCache(get<ApiClient>(), get<BaseCache>());

    // Register Repository without cache
    _registerRepoWithOutCache();
  }

  _registerRepoWithOutCache() {
    // Register if any repository don't have any cache
    registerFactory<WelcomeRepository>(() => WelcomeRepositoryImpl());

    _registerUseCase();
  }

  _registerRepoWithCache(ApiClient client, BaseCache cache) {
    _registerAuthRepositories(client, cache);
    _registerTradeRepositories(client, cache);
  }

  _registerUseCase() {
    registerFactory<WelcomeUseCase>(() => WelcomeUseCase(serviceLocator()));
    registerFactory<AuthUseCase>(() => AuthUseCase(serviceLocator()));
  }

  _registerTradeRepositories(ApiClient client, BaseCache cache) {
    var tradeHttp = TradeHttpImp(client);
    var tradeCache = TradeCacheImpl(cache, tradeHttp);
    registerSingleton<TradeRepository>(tradeCache);
  }

  _registerAuthRepositories(ApiClient client, BaseCache cache) {
    var authHttp = AuthHttpImpl(client);
    var authCache = AuthCacheImpl(cache, authHttp);
    registerSingleton<AuthRepository>(authCache);
  }

  static registerSingleton<T extends Object>(object) {
    serviceLocator.registerSingleton<T>(object);
  }

  static registerFactory<T extends Object>(object) {
    serviceLocator.registerFactory<T>(object);
  }

  static T get<T extends Object>() {
    return serviceLocator.get<T>();
  }
}
