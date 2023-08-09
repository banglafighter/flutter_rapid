import 'package:fr_core/fr_core.dart';
import 'package:fr_ui/fr_ui.dart';

class RapidNotify {
  static SnackbarController? _snackbarController;

  static void snackbar(
      String title,
      String message, {
        Color? colorText,
        Color? backgroundColor,
        Widget? icon,
        Widget? titleText,
        Widget? messageText,
        bool? isDismissible,
        Duration? duration = const Duration(seconds: 4),
        Curve? forwardAnimationCurve,
        Curve? reverseAnimationCurve,
        SnackPosition? snackPosition = SnackPosition.TOP,
      }) {
    SnackbarController.closeCurrentSnackbar();
    if (_snackbarController != null && SnackbarController.isSnackbarBeingShown) {
      _snackbarController!.close(withAnimations: false);
    }
    _snackbarController = Get.snackbar(
      title,
      message,
      colorText: colorText,
      backgroundColor: backgroundColor,
      icon: icon,
      titleText: titleText,
      messageText: messageText,
      isDismissible: isDismissible,
      duration: duration,
      forwardAnimationCurve: forwardAnimationCurve,
      reverseAnimationCurve: reverseAnimationCurve,
      snackPosition: snackPosition,
    );
  }

  static void error(String message, {String title = "Error"}) {
    snackbar(
      title,
      message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      icon: const Icon(Icons.cancel, color: Colors.white),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  static void success(String message, {String title = "Success"}){
    snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  static void info(String message, {String title = "Info"}){
    snackbar(
      title,
      message,
      backgroundColor: Colors.blueGrey,
      colorText: Colors.white,
      icon: const Icon(Icons.info, color: Colors.white),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  static void dialog({
    String? title,
    String? message,
    List<Widget>? actions,
    Widget? content,
    Widget? titleWidget,
    bool barrierDismissible = true,
    bool scrollable = false,
    bool closButton = true,
    String closeText = "Close",

    TextStyle? titleStyle,
    TextStyle? messageStyle,
    double? titleFontSize,
    Color? titleColor,
    FontWeight? titleFontWeight,
    double? messageFontSize,
    Color? messageColor,
    FontWeight? messageFontWeight,
  }) {

    Widget? titleWidget;
    if (title != null) {
      titleStyle ??= TextStyle(fontSize: titleFontSize, color: titleColor, fontWeight: titleFontWeight);
      titleWidget = Text(title, style: titleStyle,);
    }

    if(content == null && message != null){
      messageStyle ??= TextStyle(fontSize: messageFontSize, color: messageColor, fontWeight: messageFontWeight);
      content = Text(message, style: titleStyle,);
    }

    if (closButton) {
      Widget close = FrTextButton(
        name: closeText,
        onPressed: () {
          Get.back();
        },
        color: Colors.red,
      );
      if (actions == null) {
        actions = [close];
      } else {
        actions.insert(0, close);
      }
    }

    AlertDialog alertDialog = AlertDialog(
      title: titleWidget,
      scrollable: scrollable,
      content: content,
      actions: actions,
    );
    Get.dialog(
      alertDialog,
      barrierDismissible: barrierDismissible,
    );
  }

  static void confirmDialog({
    required VoidCallback onConfirm,
    String buttonText = "Confirm",
    String title = "Confirm",
    String message = "Are you sure want to perform this operation?",
  }) {
    dialog(
      barrierDismissible: false,
      title: title,
      message: message,
      actions: [FrTextButton(name: buttonText, onPressed: onConfirm)],
    );
  }
}