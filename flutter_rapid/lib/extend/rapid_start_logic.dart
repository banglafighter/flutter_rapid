import 'package:fr_core/fr_core.dart';
import '../common/rapid_preference_store.dart';
import '../logic/rapid_global_state_logic.dart';

class RapidStartLogic extends RapidLogic {
  final RapidGlobalStateLogic globalState = Get.find();
  final RapidPreferenceStore preferenceStore = Get.find();
}