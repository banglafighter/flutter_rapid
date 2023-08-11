import 'package:flutter_rapid/flutter_rapid.dart';
import '../common/app_push_notify_callback.dart';
import '../example_app_registry.dart';
import '../page/bottom_nav/bottom_nav_view.dart';
import 'app_config.dart';
import 'app_system_conf_helper.dart';

@pragma('vm:entry-point')
Future<void> _backgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  RapidRemoteMessage rapidMessage = RapidRemoteMessage().initFromFirebaseMessage(message);
  RapidPushNotifyManager.inst.notify(
    99,
    title: "Background Message",
    body: "Showing from Background Message Notify callback",
  );
}

class AppSystemConfig extends RapidSystemConfig {
  String appTitle = "Flutter Rapid App";
  ThemeData theme = ThemeData(primarySwatch: Colors.blue);
  ThemeData darkTheme = ThemeData.dark();
  Map<String, Locale> availableLocal = {
    "bn_BD": const Locale('bn', 'BD'),
    "en_US": const Locale('en', 'US'),
    "ur_PK": const Locale('ur', 'PK')
  };
  String? initialRoute = BottomNavView.routeName;

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

  Future<void> onAppStartup() async {
    await RapidPushNotifyManager.inst.init(
      androidIcon: "ic_launcher",
      pushNotifyCallback: AppPushNotifyCallback(),
    );
    await RapidFirebaseNotification.inst.init(
      notifyCallback: AppFirebaseNotifyCallback()
    );
    RapidFirebaseNotification.onBackgroundMessageHandler(_backgroundMessage);
  }
}
