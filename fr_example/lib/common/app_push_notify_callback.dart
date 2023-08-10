import 'dart:convert';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:fr_example/page/discount/discount_view.dart';

class AppPushNotifyCallback extends RapidPushNotifyCallback {

  @override
  void iOSNotificationReceived(int id, String? title, String? body, String? payload) {

  }

  @override
  void onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      var data = json.decode(payload);
      if(data != null && data.containsKey("action") && FlutterRapidRegistry.getView(data["action"]) != null){
       Get.toNamed(data["action"]!, arguments: data);
      }
    } else {
      RapidNotify.info("Payload Not Available");
    }
  }
}