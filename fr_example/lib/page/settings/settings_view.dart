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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(controller.globalState.themeIcon.value),
                FrTextButton(
                  onPressed: () {
                    controller.globalState.toggleThemeMode();
                  },
                  name: "Switch Theme".tr,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrTextButton(
                  onPressed: () {
                    controller.globalState.changeLocale("bn_BD");
                  },
                  name: 'Bangla'.tr,
                ),
                FrTextButton(
                  onPressed: () {
                    controller.globalState.changeLocale("en_US");
                  },
                  name: 'English'.tr
                ),
                FrTextButton(
                  onPressed: () {
                    controller.globalState.changeLocale("ur_PK");
                  },
                  name: 'Urdu'.tr,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrTextButton(
                  onPressed: () {
                    controller.globalState.showBusy(dismissible: true);
                  },
                  name: 'Show Busy'.tr,
                ),
                FrTextButton(
                  onPressed: () {
                    controller.globalState.hideBusy();
                  },
                  name: 'Hide Busy'.tr,
                ),
                FrTextButton(
                  onPressed: () {
                    controller.globalState.showBusy();
                    Future.delayed(Duration(seconds: 5), () {
                      controller.globalState.hideBusy();
                    });
                  },
                  name: 'Show Busy with block'.tr,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrTextButton(
                  onPressed: () {
                    RLog.print("Log Means Debug Log");
                  },
                  name: 'Print Log'.tr,
                ),
                FrTextButton(
                  onPressed: () {
                    RLog.error("Print Error Log");
                  },
                  name: 'Error Log'.tr,
                ),
                FrTextButton(
                  onPressed: () {
                    RLog.info("Print Info Log");
                  },
                  name: 'Info Log'.tr,
                ),
                FrTextButton(
                  onPressed: () {
                    RLog.warning("Print Warning Log");
                  },
                  name: 'Warning Log'.tr,
                ),
              ],
            ),
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
