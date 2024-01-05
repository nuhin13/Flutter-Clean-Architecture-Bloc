import 'package:flutter/material.dart';
import '../core/data/http/api_client_config.dart';


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

  loadData(Map<String, dynamic> map) {
    apiBaseUrl = map['API_BASE_URL'];
    apiVersion = map['API_VERSION'];
    debug = map['APP_DEBUG'] == 'true';
    defaultLocale = Locale(map['DEFAULT_LOCALE'] ?? 'en');
  }
}

final AppConfig appConfig = AppConfig();
