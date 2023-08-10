import 'dart:convert';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrElevatedButton(
                  onPressed: () {
                    RapidNotify.success("Operation Successful");
                  },
                  name: "Success".tr,
                ),
                FrElevatedButton(
                  onPressed: () {
                    RapidNotify.error("Operation Failed");
                  },
                  name: "Error".tr,
                ),
                FrElevatedButton(
                  onPressed: () {
                    RapidNotify.info("Please don't do this in future");
                  },
                  name: "Info".tr,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrElevatedButton(
                  name: "Confirm",
                  onPressed: () {
                    RapidNotify.confirmDialog(
                      onConfirm: () {
                        RapidNotify.success("Operation Confirmed");
                      },
                    );
                  },
                ),
                FrElevatedButton(
                  name: "Simple",
                  onPressed: () {
                    RapidNotify.dialog(
                        message: "This is example message for you. You may read this message or close the dialog.");
                  },
                ),
                FrElevatedButton(
                  name: "No Close",
                  onPressed: () {
                    RapidNotify.dialog(
                      message: "This is example message for you. You may read this message or close the dialog.",
                      closButton: false,
                    );
                  },
                ),
                FrElevatedButton(
                  name: "Nested",
                  onPressed: () {
                    RapidNotify.confirmDialog(
                      message: "Nested 1 Dialog",
                      onConfirm: () {
                        RapidNotify.dialog(message: "Nested 2");
                      },
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrOutlinedButton(
                  onPressed: () {
                    RapidPushNotifyManager.inst.notify(1);
                  },
                  name: 'Notify',
                ),
                FrOutlinedButton(
                  onPressed: () {
                    RapidPushNotifyManager.inst
                        .notify(2, title: "Notification Title");
                  },
                  name: 'With Title',
                ),
                FrOutlinedButton(
                  onPressed: () {
                    RapidPushNotifyManager.inst.notify(3,
                        title: "Notification Title", body: "Notification Body");
                  },
                  name: 'With Body',
                ),
                FrOutlinedButton(
                  onPressed: () {
                    RapidPushNotifyManager.inst.notify(
                      4,
                      title: "Special Offer",
                      body: "If you buy more than 3 items, then will get 15% Discount & Free Shipping.",
                      largeIconUrl: "https://banglafighter.com/static-files/bismillah/internship.jpg",
                    );
                  },
                  name: 'With Image',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FrOutlinedButton(
                  onPressed: () {
                    Map<String,dynamic> discount = {
                      "action": "/discount",
                      "message": "15% Discount of all product during the Ramadan."
                    };
                    RapidPushNotifyManager.inst.notify(
                      1,
                      title: "15% Discount",
                      body: "15% Ramadan Discount.",
                      payload: json.encode(discount),
                    );
                  },
                  name: 'Notify Discount',
                ),
                FrOutlinedButton(
                  onPressed: () {
                    Map<String,dynamic> discount = {
                      "action": "/summer-discount",
                      "message": "You will get lots of Summer Discount. Visit our shop or see the discount pages."
                    };
                    RapidPushNotifyManager.inst.notify(
                      1,
                      title: "Summer Discount",
                      body: "Lots of Summer discount available.",
                      payload: json.encode(discount),
                    );
                  },
                  name: 'Summer Discount',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
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
