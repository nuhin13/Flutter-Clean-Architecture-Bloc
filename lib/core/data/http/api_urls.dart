
import '../../../app/app_config.dart';

class ApiUrl {
  static final baseUrl = appConfig.getApiClientConfig().baseUrl;
  static final apiVersion = appConfig.getApiClientConfig().apiVersion;

  static final login = "$baseUrl/api/Account/Login";
  static logCardView(int id) => "$baseUrl/api/v1/campaigns/$id/view";
}
