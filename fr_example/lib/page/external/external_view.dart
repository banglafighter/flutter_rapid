import 'package:flutter_rapid/flutter_rapid.dart';
import 'external_i18n.dart';
import 'external_logic.dart';


class ExternalView extends RapidView<ExternalLogic> {
  static String routeName = "/external";

  const ExternalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("External"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("External View"),
          ],
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<ExternalLogic>(() => ExternalLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return ExternalI18N.getTranslations();
  }
}
