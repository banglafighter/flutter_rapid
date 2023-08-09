import 'package:fr_core/fr_core.dart';

class BottomNavItem {
  final Widget icon;
  final String? label;
  Widget? activeIcon;
  final Color? backgroundColor;
  final String? tooltip;
  final String routeName;

  BottomNavItem({
    required this.icon,
    required this.routeName,
    this.label,
    this.backgroundColor,
    this.tooltip,
  });
}

enum BottomNavType {
  system,
  convex,
}