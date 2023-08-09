import 'package:fr_core/fr_core.dart';
import 'bottom_nav_structure.dart';

class BottomNavItem {
  final Widget icon;
  final String? label;
  Widget? activeIcon;
  final Color? backgroundColor;
  final String? tooltip;
  final String routeName;
  final bool enableBackInNav;
  final bool enableParentRouteKey;
  final BottomNavTap? onTap;

  BottomNavItem({
    required this.icon,
    required this.routeName,
    this.label,
    this.onTap,
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