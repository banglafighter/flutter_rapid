import 'package:flutter_rapid/flutter_rapid.dart';

class AppBaseConfig extends RapidEnvConfig {}

class DevConfig extends AppBaseConfig {
  String bannerTitle = 'DEV';
}

class StageConfig extends AppBaseConfig {
  String bannerTitle = 'STAGE';
}

class ProdConfig extends AppBaseConfig {
  bool debug = false;
  bool enableLog = false;
  bool enableBanner = false;
  String bannerTitle = 'PROD';
}
