abstract class NotificationRepository {
  Future<String?> subscribe(String deviceToken);
  Future<String?> unsubscribe(String deviceToken);
}
