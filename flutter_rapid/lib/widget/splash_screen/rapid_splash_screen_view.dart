import 'package:fr_core/fr_core.dart';
import 'rapid_splash_screen_data.dart';
import 'rapid_splash_screen_logic.dart';

class RapidSplashScreenView extends RapidView<RapidSplashScreenLogic> {
  static String routeName = "/system-splash";

  final RapidSplashScreenData splashScreenData;

  const RapidSplashScreenView(this.splashScreenData, {super.key});

  Widget splashScreen(BuildContext context) {
    return Container(
      color: splashScreenData.backgroundColor,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Hero(
                    tag: "splashScreenImage",
                    child: Container(
                      height: 82,
                      width: 82,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 1),
                      child: Image.asset(
                        splashScreenData.logoPath,
                        filterQuality: FilterQuality.high,
                        height: 82,
                        width: 82,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    splashScreenData.appName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: splashScreenData.appNameFontSize,
                        color: splashScreenData.appNameColor),
                  ),
                ),
                Text(
                  splashScreenData.appVersion,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: splashScreenData.appVersionColor,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 51.0),
              child: Text(
                splashScreenData.copyRight,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  color: splashScreenData.copyRightColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (splashScreenData.customView != null) {
      return splashScreenData.customView ?? Container();
    }
    return Scaffold(
      body: splashScreen(context),
    );
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return {
      "bn_BD": {},
      "en_US": {},
    };
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  void loadDependentLogics() {
    Get.put<RapidSplashScreenLogic>(RapidSplashScreenLogic());
  }
}
