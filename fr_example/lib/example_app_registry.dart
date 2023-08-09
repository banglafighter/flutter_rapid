import 'package:flutter_rapid/flutter_rapid.dart';
import 'page/bottom_nav/bottom_nav_view.dart';
import 'page/external/external_view.dart';
import 'page/home/home_view.dart';
import 'page/notify/notify_view.dart';
import 'page/settings/settings_view.dart';

class ExampleAppRegistry extends RapidModuleRegistry {
  @override
  List<RapidView> getPages() {
    return [
      const HomeView(),
      const BottomNavView(),
      const SettingsView(),
      const ExternalView(),
      const NotifyView(),
    ];
  }
}
