import 'package:flutter_clean_architecture/features/authentication/data/repo_impl/auth_cache_impl.dart';
import 'package:flutter_clean_architecture/features/welcome/domain/usecase/welecom_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../../app/app_config.dart';
import '../../features/authentication/data/repo_impl/auth_http_impl.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../../features/trades/data/cache/trade_cache_impl.dart';
import '../../features/trades/data/http/trade_http_impl.dart';
import '../../features/trades/domain/repo/trade_repository.dart';
import '../../features/welcome/domain/repository/welcome_repository.dart';
import '../data/cache/base_cache.dart';
import '../data/cache/preference_cache.dart';
import '../data/http/api_client.dart';
import '../data/http/api_client_config.dart';

final serviceLocator = GetIt.instance;

/*Future<void> setUpServiceLocator(AppConfig appConfig) async {
  serviceLocator.registerSingleton<AppConfig>(appConfig);

  //check if user logged in or not
  // serviceLocator.registerFactory<CheckUserLoginStatus>(
  //   () => CheckUserLoginStatusImpl(),
  // );
  //usecase
  // serviceLocator.registerFactory<LoginUserUsecase>(() => LoginUserUsecase());

  //datasource
  // serviceLocator.registerFactory<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());

  //repositories
  // serviceLocator.registerFactory<LoginUserRepository>(() => LoginUserRepositoryImpl());

  // serviceLocator.registerSingleton<UserCacheService>(UserCacheService());
  //external
  */ /*final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);*/ /*
  // request
  // serviceLocator.registerSingleton<Request>(Request());

  serviceLocator.registerFactory<ApiClient>(
      () => ApiClient(serviceLocator<ApiClientConfig>(), serviceLocator<BaseCache>(), Logger()));
  serviceLocator.registerFactory<BaseCache>(() => PreferenceCache());

  serviceLocator.registerFactory<ApiClientConfig>(() => ApiClientConfig(
        baseUrl: appConfig.apiBaseUrl,
        isDebug: appConfig.debug,
        apiVersion: appConfig.apiVersion,
      ));

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());

  serviceLocator.registerFactory<TradeRepository>(() => TradeHttpImp());

  */ /*  serviceLocator.registerSingleton<NotificationService>(notificationService);

  serviceLocator.registerSingleton<LogoutService>(
    LogoutService(
      cache: serviceLocator<BaseCache>(),
      notificationService: serviceLocator<NotificationService>(),
    ),
  );*/ /*

  // serviceLocator.registerFactory<NotificationRepository>(() => NotificationHttpRepository(serviceLocator<ApiClient>()));
  //
  // serviceLocator.registerFactory<MapUseCase>(() => MapUseCase());
  //
  // serviceLocator.registerFactory<OtpRemoteDataSource>(() => OtpRemoteDataSourceImpl());
  // serviceLocator.registerFactory<CampaignRepository>(() => CampaignDataSource());
  //
  // serviceLocator.registerFactory<SplashRepository>(() => SplashRepositoryImpl());
  // serviceLocator.registerFactory<SplashHttpDatasourceImpl>(() => SplashHttpDatasourceImpl());
  // serviceLocator.registerFactory<SplashHttpUseCase>(() => SplashHttpUseCase());

  /// campaign status change
  // serviceLocator.registerFactory<CampaignStatusChangeRepository>(() => CampaignStatusChangeRepositoryImpl());
  // serviceLocator.registerFactory<CampaignStatusChangeDatasource>(() => CampaignStatusChangeDatasourceCachedImpl());
  // serviceLocator.registerFactory<CampaignStatusChangeUseCase>(() => CampaignStatusChangeUseCase());

  /// end campaign status change

  serviceLocator.registerSingleton<Logger>(Logger());
}*/

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
    // Register Repository without cache
    _registerRepoWithOutCache();

    // Register Repository with cache
    _registerRepoWithCache(get<ApiClient>(), get<BaseCache>());
  }

  _registerRepoWithOutCache() {
     registerFactory<WelcomeRepository>(() => WelcomeUseCase());
  }

  _registerRepoWithCache(ApiClient client, BaseCache cache) {
    _registerAuthRepositories(client, cache);
    _registerTradeRepositories(client, cache);
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
