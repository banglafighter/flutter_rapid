import 'package:flutter_rapid/flutter_rapid.dart';


class AppFirebaseNotifyCallback extends RapidFirebaseNotifyCallback {
  @override
  void onForegroundMessage(RapidRemoteMessage message) {
    RapidPushNotifyManager.inst.notify(
      99,
      title: "Foreground Message",
      body: "Showing from Foreground Message Notify callback",
    );
  }

  @override
  void onMessageOpenedInApp(RapidRemoteMessage message) {
    RapidPushNotifyManager.inst.notify(
      99,
      title: "Message Opened in App",
      body: "Showing from Message Opened in App Notify callback",
    );
  }
}

class AppSystemConfHelper {

}
