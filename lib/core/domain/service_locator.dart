import 'package:flutter_clean_architecture/features/authentication/data/repo_impl/auth_repository_impl.dart';
import 'package:flutter_clean_architecture/features/authentication/domain/repository/auth_repository.dart';
import 'package:flutter_clean_architecture/features/trades/data/http/trade_http_impl.dart';
import 'package:flutter_clean_architecture/features/trades/domain/repo/trade_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import '../../app/app_config.dart';
import '../../services/logout/logout_service.dart';
import '../../services/notification/service.dart';
import '../data/cache/base_cache.dart';
import '../data/cache/preference_cache.dart';
import '../data/http/api_client.dart';
import '../data/http/api_client_config.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator(AppConfig appConfig) async {
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
  /*final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerFactory<SharedPreferences>(() => sharedPreferences);*/
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

  /*  serviceLocator.registerSingleton<NotificationService>(notificationService);

  serviceLocator.registerSingleton<LogoutService>(
    LogoutService(
      cache: serviceLocator<BaseCache>(),
      notificationService: serviceLocator<NotificationService>(),
    ),
  );*/

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
}
