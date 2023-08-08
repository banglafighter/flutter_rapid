import 'package:fr_core/fr_core.dart';

class RapidI18N extends Translations {
  Map<String, Map<String, String>> _i18n = {};

  @override
  Map<String, Map<String, String>> get keys => _i18n;

  addTranslations(Map<String, Map<String, String>> translations) {
    if (translations.isEmpty) {
      return;
    }
    for (String key in translations.keys) {
      if (!_i18n.containsKey(key)) {
        _i18n[key] = translations[key]!;
      } else {
        _i18n[key] = {...?_i18n[key], ...?translations[key]};
      }
    }
  }
}