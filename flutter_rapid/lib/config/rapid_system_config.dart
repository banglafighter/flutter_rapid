import 'package:fr_core/fr_core.dart';
import '../structure/rapid_module_registry.dart';
import '../widget/rapid_busy_widget.dart';
import '../widget/splash_screen/rapid_splash_screen_data.dart';
import 'rapid_env_config.dart';

class RapidSystemConfig {
  String appTitle = '';

  Widget? home;
  String? initialRoute;
  Transition defaultTransition = Transition.noTransition;

  ThemeData theme = ThemeData(primarySwatch: Colors.blue);
  ThemeData darkTheme = ThemeData.dark();
  TextDirection textDirection = TextDirection.ltr;
  ThemeMode themeMode = ThemeMode.light;

  Locale fallbackLocale = const Locale('en', 'US');
  Locale locale = const Locale('en', 'US');
  Map<String, Locale> availableLocal = {
    "bn_BD": const Locale('bn', 'BD'),
    "en_US": const Locale('en', 'US')
  };
  Map<String, String> availableFont = {};

  List<RapidModuleRegistry> modules = [];

  Widget systemBusyWidget = const RapidBusyWidget();
  RapidSplashScreenData splashScreenData = RapidSplashScreenData();

  String currentEnv = "dev";
  Map<String, RapidEnvConfig> availableEnvironment = {};

  initConfig(var env) {
    return Get.put<RapidEnvConfig>(env, permanent: true);
  }

  Future<void> onAppStartup() async {}

}
