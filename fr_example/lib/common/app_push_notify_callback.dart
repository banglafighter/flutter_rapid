import 'dart:convert';
import 'package:flutter_rapid/flutter_rapid.dart';

class AppPushNotifyCallback extends RapidPushNotifyCallback {

  @override
  void iOSNotificationReceived(RapidIosNotifyResponse response) {

  }

  @override
  void onSelectNotification(RapidNotifyResponse response) {
    if (response.payload != null && response.payload!.isNotEmpty) {
      var data = json.decode(response.payload ?? "{}");
      if(data != null && data.containsKey("action") && FlutterRapidRegistry.getView(data["action"]) != null){
       Get.toNamed(data["action"]!, arguments: data);
      }
    } else {
      RapidNotify.info("Payload Not Available");
    }
  }
}