import 'package:flutter_rapid/flutter_rapid.dart';
import 'notify_i18n.dart';
import 'notify_logic.dart';

class NotifyView extends RapidView<NotifyLogic> {
  static String routeName = "/notify";

  const NotifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Notify"),
          ],
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<NotifyLogic>(() => NotifyLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return NotifyI18N.getTranslations();
  }
}
