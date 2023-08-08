import 'package:fr_core/rapid_view.dart';

class FlutterRapidRegistry {
  static const Map<String, RapidView> _viewRegistry = {};

  static void addViewToRegistry(RapidView rapidView) {
    if (!_viewRegistry.containsKey(rapidView.getRouteName())) {
      _viewRegistry[rapidView.getRouteName()] = rapidView;
    }
  }

  static RapidView? getView(String routeName) {
    if (_viewRegistry.containsKey(routeName)) {
      return _viewRegistry[routeName];
    }
    return null;
  }
}
