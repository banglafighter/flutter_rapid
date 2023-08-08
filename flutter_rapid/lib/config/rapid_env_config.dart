import 'package:fr_common/fr_common.dart';
import 'package:fr_core/fr_core.dart';

class RapidEnvConfig extends RapidService {
  bool enableLog = true;
  LogLevel logLevel = LogLevel.all;
  bool enableBanner = true;
  bool debug = true;
  String bannerTitle = 'DEBUG';
}
