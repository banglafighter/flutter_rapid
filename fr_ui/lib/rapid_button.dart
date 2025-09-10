import 'package:fr_core/fr_core.dart';

class FrTextButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  TextStyle? textStyle;
  Widget? child;

  FrTextButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.child,
    this.onLongPress,
    this.style,
    this.textStyle,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    textStyle ??= TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
    Widget childWidget = child ??= Text(
      name,
      style: textStyle,
    );
    return TextButton(
      onPressed: onPressed,
      style: style,
      onLongPress: onLongPress,
      child: childWidget,
    );
  }
}

class FrElevatedButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  TextStyle? textStyle;
  Widget? child;

  FrElevatedButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.child,
    this.onLongPress,
    this.style,
    this.textStyle,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    textStyle ??= TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
    Widget childWidget = child ??= Text(
      name,
      style: textStyle,
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      onLongPress: onLongPress,
      child: childWidget,
    );
  }
}


class FrOutlinedButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  TextStyle? textStyle;
  Widget? child;

  FrOutlinedButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.child,
    this.onLongPress,
    this.style,
    this.textStyle,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    textStyle ??= TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
    Widget childWidget = child ??= Text(
      name,
      style: textStyle,
    );
    return OutlinedButton(
      onPressed: onPressed,
      style: style,
      onLongPress: onLongPress,
      child: childWidget,
    );
  }
}
