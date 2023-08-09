import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fr_core/fr_core.dart';
import 'bottom_nav_data.dart';
import 'bottom_nav_structure.dart';

class BottomNavManager extends StatelessWidget {
  final BottomNavType navType;
  final BottomNavData? bottomNavData;
  final List<BottomNavItem> items;
  final ValueChanged<int>? onTap;

  const BottomNavManager({
    this.navType = BottomNavType.system,
    this.bottomNavData,
    super.key,
    this.onTap,
    required this.items,
  });

  Widget _getNav(BottomNavType navType) {
    if (navType == BottomNavType.convex) {
      return _getConvexNav();
    }
    return _getSystemNav();
  }

  void _onTapItem(int index) {
    if (onTap != null) {
      onTap!(index);
    }
  }

  ConvexAppBar _getConvexNav() {
    List<TabItem> _items = [];
    for (BottomNavItem item in items) {
      _items.add(TabItem(
        icon: item.icon,
        title: item.label,
        activeIcon: item.activeIcon,
      ));
    }
    return ConvexAppBar(
      items: _items,
      onTap: _onTapItem,
    );
  }

  BottomNavigationBar _getSystemNav() {
    List<BottomNavigationBarItem> systemItems = [];
    for (BottomNavItem item in items) {
      systemItems.add(BottomNavigationBarItem(
        icon: item.icon,
        label: item.label,
        backgroundColor: item.backgroundColor,
        tooltip: item.tooltip,
        activeIcon: item.activeIcon,
      ));
    }
    return BottomNavigationBar(
      items: systemItems,
      onTap: _onTapItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getNav(navType);
  }
}