import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

class RapidPushNotifyChannel {
  const RapidPushNotifyChannel({
    required this.id,
    required this.name,
    this.description,
    this.groupId,
    this.importance = Importance.defaultImportance,
    this.playSound = true,
    this.sound,
    this.enableVibration = true,
    this.vibrationPattern,
    this.showBadge = true,
    this.enableLights = false,
    this.ledColor,
  });

  final String id;
  final String name;
  final String? description;
  final String? groupId;
  final Importance importance;
  final bool playSound;
  final AndroidNotificationSound? sound;
  final bool enableVibration;
  final bool enableLights;
  final Int64List? vibrationPattern;
  final Color? ledColor;
  final bool showBadge;
}
