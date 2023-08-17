import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fr_core/fr_core.dart';

typedef BottomNavTap = void Function(int index, String routeName);

abstract class BottomNavData {}

class ConvexBottomNavData extends BottomNavData {
  Color? color;
  Color? activeColor;
  Color? backgroundColor;
  Color? shadowColor;
  TapNotifier? onTabNotify;
  TabStyle? style;

  ConvexBottomNavData({
    this.color,
    this.activeColor,
    this.backgroundColor,
    this.shadowColor,
    this.style,
  });
}