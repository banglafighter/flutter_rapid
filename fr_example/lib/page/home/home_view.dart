import 'package:flutter_rapid/flutter_rapid.dart';
import 'home_i18n.dart';
import 'home_logic.dart';

class HomeView extends RapidView<HomeLogic> {
  static String routeName = "/home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Rapid App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current Config ${controller.config.bannerTitle}"),
          ],
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return HomeI18N.getTranslations();
  }
}
