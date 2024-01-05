import 'api_client.dart';

abstract class BaseHttpRepository {
  ApiClient client;
  BaseHttpRepository(this.client);
}
