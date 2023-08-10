class RapidIosNotifyResponse {
  int? id;
  String? title;
  String? body;
  String? payload;

  RapidIosNotifyResponse({
    this.id,
    this.title,
    this.body,
    this.payload,
  });
}

class RapidNotifyResponse {
  int? id;
  String? payload;
  String? actionId;
  String? type;
  String? input;

  RapidNotifyResponse({
    this.id,
    this.payload,
    this.actionId,
    this.type,
    this.input,
  });
}

abstract class RapidPushNotifyCallback {
  void onSelectNotification(RapidNotifyResponse response);
  void iOSNotificationReceived(RapidIosNotifyResponse response);
}
