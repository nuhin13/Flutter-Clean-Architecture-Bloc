import 'package:flutter/material.dart';
import '../../core/data/http/client/api_client_config.dart';

class AppConfig {
  static const String _prodEnvName = "production";
  static const String _devEnvName = "development";

  late final String apiBaseUrl;
  late final String apiVersion;
  final String environment = _prodEnvName;
  late final bool debug;
  late final Locale defaultLocale;

  static final _appConfig = AppConfig._internal();

  AppConfig._internal();

  bool isProduction() {
    return environment == _prodEnvName;
  }

  bool isDevelopment() {
    return environment == _devEnvName;
  }

  bool isDebug() {
    return debug;
  }

  bool isNotDebug() {
    return !debug;
  }

  ApiClientConfig getApiClientConfig() {
    return ApiClientConfig(
      baseUrl: apiBaseUrl,
      apiVersion: apiVersion,
      isDebug: debug,
    );
  }

  factory AppConfig() {
    return _appConfig;
  }

  /// Loads the application configuration from a given map.
  ///
  /// The map should contain the following keys:
  /// - 'API_BASE_URL': The base URL for the API.
  /// - 'API_VERSION': The version of the API.
  /// - 'APP_DEBUG': A string representing whether the application is in debug mode. 'true' means debug mode is on.
  /// - 'DEFAULT_LOCALE': The default language for the application. If not provided, it defaults to 'en'.
  ///
  /// Each key's value is used to set the corresponding property in the AppConfig class.
  ///
  /// @param map A map containing the application configuration.

  loadData(Map<String, dynamic> map) {
    apiBaseUrl = map['API_BASE_URL'];
    apiVersion = map['API_VERSION'];
    debug = map['APP_DEBUG'] == 'true';
    defaultLocale = Locale(map['DEFAULT_LOCALE'] ?? 'en');
  }
}

final AppConfig appConfig = AppConfig();
