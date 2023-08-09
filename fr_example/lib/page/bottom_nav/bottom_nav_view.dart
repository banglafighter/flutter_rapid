import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:fr_example/page/home/home_view.dart';
import '../external/external_view.dart';
import '../notify/notify_view.dart';
import '../settings/settings_view.dart';
import 'bottom_nav_i18n.dart';
import 'bottom_nav_logic.dart';


class BottomNavView extends RapidView<BottomNavLogic> {
  static String routeName = "/bottom-nav";

  const BottomNavView({super.key});

  List<BottomNavItem> getNavItems() {
    List<BottomNavItem> items = [
      BottomNavItem(
        routeName: HomeView.routeName,
        icon: const Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavItem(
        routeName: NotifyView.routeName,
        icon: const Icon(Icons.notifications),
        label: 'Notify',
      ),
      BottomNavItem(
        routeName: SettingsView.routeName,
        icon: const Icon(Icons.settings),
        label: 'Settings',
      ),
      BottomNavItem(
        routeName: ExternalView.routeName,
        icon: const Icon(Icons.explore),
        label: 'External',
        enableBackInNav: true,
        enableParentRouteKey: false,
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RapidNavigatorManager(
        routeKey: Get.nestedKey(12),
        initialRoute: HomeView.routeName,
      ),
      bottomNavigationBar: BottomNavManager(
        navType: BottomNavType.convex,
        items: getNavItems(),
        parentRouteKey: 12,
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<BottomNavLogic>(() => BottomNavLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return BottomNavI18N.getTranslations();
  }
}
