import 'package:flutter/material.dart';

class RapidSplashScreenData {
  Widget? customView;
  bool isEnableSplash = true;
  int delayDuration = 3;

  // Only work if build in Splash Screen used
  Color backgroundColor = const Color.fromRGBO(26, 31, 26, 1.0);
  String logoPath = "assets/splash_screen_logo.png";

  String appName = "Rapid App";
  Color appNameColor = Colors.white;
  double? appNameFontSize = 20.0;

  String appVersion = "1.0.0";
  Color appVersionColor = Colors.white;

  String copyRight = "Copyright © Flutter Rapid Application";
  Color copyRightColor = Colors.white;

  RapidSplashScreenData setWidget(Widget? customView) {
    customView = customView;
    return this;
  }

  RapidSplashScreenData disable() {
    isEnableSplash = false;
    return this;
  }

  RapidSplashScreenData setDelay(int delay) {
    delayDuration = delay;
    return this;
  }

  RapidSplashScreenData setAppVersion(String version) {
    appVersion = version;
    return this;
  }

  RapidSplashScreenData setAppName(String name) {
    appName = name;
    return this;
  }

  RapidSplashScreenData setLogo(String path) {
    logoPath = path;
    return this;
  }

  RapidSplashScreenData setCopyRight(String text) {
    copyRight = text;
    return this;
  }
}
