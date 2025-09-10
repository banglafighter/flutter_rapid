import 'package:fr_core/fr_core.dart';
import '../../extend/rapid_start_logic.dart';

class RapidSplashScreenLogic extends RapidStartLogic {
  static int delayDuration = 3;

  @override
  void onInit() {
    super.onInit();
    if (globalState.initialRoute != null) {
      Future.delayed(Duration(seconds: delayDuration), () {
        Get.offAllNamed(globalState.initialRoute ?? "");
      });
    }
  }
}
