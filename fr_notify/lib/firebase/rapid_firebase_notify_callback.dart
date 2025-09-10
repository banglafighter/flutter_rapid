import 'package:firebase_messaging/firebase_messaging.dart';

class RapidRemoteMessage {
  final Map<String, dynamic> data;
  final String? from;
  final String? senderId;
  final DateTime? sentTime;

  RapidRemoteMessage({
    this.data = const <String, dynamic>{},
    this.from,
    this.senderId,
    this.sentTime,
  });

  RapidRemoteMessage initFromFirebaseMessage(RemoteMessage message) {
    return this;
  }
}

abstract class RapidFirebaseNotifyCallback {
  void onForegroundMessage(RapidRemoteMessage message);
  void onMessageOpenedInApp(RapidRemoteMessage message);
}
