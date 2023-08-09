import 'package:fr_core/fr_core.dart';

class BottomNavItem {
  final Widget icon;
  final String? label;
  Widget? activeIcon;
  final Color? backgroundColor;
  final String? tooltip;
  final String routeName;
  final bool enableBackInNav;
  final bool enableParentRouteKey;

  BottomNavItem({
    required this.icon,
    required this.routeName,
    this.label,
    this.enableBackInNav = false,
    this.enableParentRouteKey = true,
    this.backgroundColor,
    this.tooltip,
  });
}

enum BottomNavType {
  material,
  convex,
}