import 'package:flutter_rapid/flutter_rapid.dart';
import 'discount_logic.dart';


class SummerDiscountView extends RapidView<DiscountLogic> {
  static String routeName = "/summer-discount";

  const SummerDiscountView({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summer Discount"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${data["message"]}"),
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
    return {"bn_BD": {}};
  }
}
