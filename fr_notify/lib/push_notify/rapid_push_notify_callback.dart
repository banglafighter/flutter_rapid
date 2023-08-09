abstract class RapidPushNotifyCallback {
  void onSelectNotification(String? payload);
  void iOSNotificationReceived(int id, String? title, String? body, String? payload);
}
