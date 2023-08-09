import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fr_core/fr_core.dart';
import 'bottom_nav_data.dart';
import 'bottom_nav_structure.dart';

class BottomNavManager extends StatelessWidget {
  final BottomNavType navType;
  final BottomNavData? bottomNavData;
  final List<BottomNavItem> items;
  final BottomNavTap? onTap;
  final int currentIndex;
  final RxInt _currentIndex = 0.obs;
  final bool autoNavigation;
  final bool enableBackInNav;
  int? parentRouteKey;

  BottomNavManager({
    this.navType = BottomNavType.material,
    this.bottomNavData,
    super.key,
    this.onTap,
    this.currentIndex = 0,
    this.autoNavigation = true,
    this.enableBackInNav = false,
    this.parentRouteKey,
    required this.items,
  });

  Widget _getNav(BottomNavType navType) {
    if (navType == BottomNavType.convex) {
      return _getConvexNav();
    }
    return _getMaterialNav();
  }

  void _onTapItem(int index) {
    _currentIndex.value = index;
    BottomNavItem navItem = items[index];
    if (onTap != null) {
      onTap!(index, navItem.routeName);
    }
    if (autoNavigation) {
      int? parentNavId;
      if (parentRouteKey != null && navItem.enableParentRouteKey) {
        parentNavId = parentRouteKey;
      }
      if (enableBackInNav || navItem.enableBackInNav) {
        Get.toNamed(navItem.routeName, id: parentNavId);
      } else {
        Get.offAllNamed(navItem.routeName, id: parentNavId);
      }
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
      initialActiveIndex: _currentIndex.value,
    );
  }

  BottomNavigationBar _getMaterialNav() {
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
      currentIndex: _currentIndex.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex.value = currentIndex;
    return Obx(() => _getNav(navType));
  }
}