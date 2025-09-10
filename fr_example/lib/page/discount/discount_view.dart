import 'package:flutter_rapid/flutter_rapid.dart';
import 'discount_i18n.dart';
import 'discount_logic.dart';


class DiscountView extends RapidView<DiscountLogic> {
  static String routeName = "/discount";

  const DiscountView({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Discount"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Discount Message: ${data["message"]}"),
          ],
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<DiscountLogic>(() => DiscountLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return DiscountI18N.getTranslations();
  }
}
