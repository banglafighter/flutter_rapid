import 'package:fr_core/fr_core.dart';
import '../data/rapid_system_enum.dart';
import 'rapid_preference_store.dart';

class RapidSystemPreference extends RapidService {
  final RapidPreferenceStore preferenceStore = Get.find();

  setThemMode(ThemeMode themeMode) {
    preferenceStore.save(RapidSystemEnum.themeMode.name, themeMode.name);
  }

  String? getThemMode() {
    return preferenceStore.read<String?>(RapidSystemEnum.themeMode.name);
  }

  setLocale(String localeName) {
    preferenceStore.save(RapidSystemEnum.locale.name, localeName);
  }

  String? getLocale() {
    return preferenceStore.read<String?>(RapidSystemEnum.locale.name);
  }
}
