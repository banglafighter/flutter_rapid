import 'package:flutter_rapid/flutter_rapid.dart';
import 'settings_i18n.dart';
import 'settings_logic.dart';


class SettingsView extends RapidView<SettingsLogic> {
  static String routeName = "/settings";

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Settings"),
          ],
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<SettingsLogic>(() => SettingsLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return SettingsI18N.getTranslations();
  }
}
