import 'package:fr_notify/fr_notify.dart';

class RapidFirebaseNotification {
  late RapidFirebaseNotifyCallback _notifyCallback;

  static RapidFirebaseNotification get inst => RapidFirebaseNotification();

  static void onBackgroundMessageHandler(BackgroundMessageHandler handler) {
    FirebaseMessaging.onBackgroundMessage(handler);
  }

  static Future<RapidRemoteMessage> getBackgroundData(RemoteMessage message) async {
    await Firebase.initializeApp();
    return RapidRemoteMessage().initFromFirebaseMessage(message);
  }

  Future<void> init({
    required RapidFirebaseNotifyCallback notifyCallback,
  }) async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    _notifyCallback = notifyCallback;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _initMessageListener();
    } else {
      RapidNotify.error("Please add Notification Permissions");
    }
  }

  void _initMessageListener() {
    RapidRemoteMessage rapidRemoteMessage;
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      rapidRemoteMessage = RapidRemoteMessage();
      _notifyCallback.onMessageOpenedInApp(rapidRemoteMessage);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      rapidRemoteMessage = RapidRemoteMessage();
      _notifyCallback.onForegroundMessage(rapidRemoteMessage);
    });
  }
}
