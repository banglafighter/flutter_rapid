import 'package:fr_core/fr_core.dart';
import '../common/rapid_system_preference.dart';

class RapidGlobalStateLogic extends RapidLogic {
  Rx<IconData> themeIcon = Rx(Icons.light_mode_outlined);
  final RapidSystemPreference systemPreference = Get.find();
  late Map<String, Locale>? availableLocal;
  late Map<String, String>? availableFont;
  final isSystemBusy = false.obs;
  final isSystemBusyDismissible = false.obs;
  final authId = Rxn<dynamic>();
  final authUser = Rxn<dynamic>();
  final currentUser = Rxn<dynamic>();
  String? initialRoute;

  void toggleThemeMode() {
    ThemeMode themeMode;
    if (Get.isDarkMode) {
      themeMode = ThemeMode.light;
      themeIcon.value = Icons.light_mode_outlined;
    } else {
      themeMode = ThemeMode.dark;
      themeIcon.value = Icons.dark_mode_outlined;
    }
    Get.changeThemeMode(themeMode);
    systemPreference.setThemMode(themeMode);
  }

  ThemeMode getInitThemeMode(ThemeMode themeMode) {
    String? theme = systemPreference.getThemMode();
    if (theme == null) {
      return themeMode;
    } else if (theme == ThemeMode.light.name) {
      themeIcon.value = Icons.light_mode_outlined;
      return ThemeMode.light;
    } else if (theme == ThemeMode.dark.name) {
      themeIcon.value = Icons.dark_mode_outlined;
      return ThemeMode.dark;
    }
    return themeMode;
  }

  void changeLocale(String localeName) {
    if (availableLocal != null && availableLocal!.containsKey(localeName)) {
      Get.updateLocale(availableLocal![localeName]!);
      systemPreference.setLocale(localeName);
    }
  }

  Locale? getInitLocale(Locale? locale) {
    if (locale != null) {
      String? localSavedName = systemPreference.getLocale();
      if (localSavedName != null &&
          availableLocal != null &&
          availableLocal!.containsKey(localSavedName)) {
        return availableLocal?[localSavedName];
      }
    }
    return locale;
  }

  void showBusy({bool dismissible = false}) {
    isSystemBusyDismissible(dismissible);
    isSystemBusy(true);
  }

  void hideBusy() {
    isSystemBusy(false);
  }
}