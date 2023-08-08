import 'package:flutter_rapid/flutter_rapid.dart';
import '../example_app_registry.dart';
import '../page/home/home_view.dart';
import 'app_config.dart';

class AppSystemConfig extends RapidSystemConfig {
  String appTitle = "Flutter Rapid App";
  ThemeData theme = ThemeData(primarySwatch: Colors.blue);
  ThemeData darkTheme = ThemeData.dark();
  Map<String, Locale> availableLocal = {
    "bn_BD": const Locale('bn', 'BD'),
    "en_US": const Locale('en', 'US'),
    "ur_PK": const Locale('ur', 'PK')
  };
  String? initialRoute = HomeView.routeName;

  List<RapidModuleRegistry> modules = [
    ExampleAppRegistry(),
  ];

  RapidSplashScreenData splashScreenData = RapidSplashScreenData().setDelay(5);

  String currentEnv = "dev";
  Map<String, RapidEnvConfig> availableEnvironment = {
    "dev": DevConfig(),
    "stage": StageConfig(),
    "prod": ProdConfig(),
  };

  initConfig(var env) {
    return Get.put<AppBaseConfig>(env);
  }
}
