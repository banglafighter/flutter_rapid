import 'package:fr_core/fr_core.dart';
import '../base/flutter_rapid_registry.dart';

class RapidNavigatorManager extends StatelessWidget {
  final String initialRoute;
  final RouteFactory? onUnknownRoute;
  final Key? routeKey;

  const RapidNavigatorManager({
    super.key,
    required this.routeKey,
    required this.initialRoute,
    this.onUnknownRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: routeKey,
      initialRoute: initialRoute,
      onGenerateRoute: (RouteSettings settings) {
        RapidView? rapidView = FlutterRapidRegistry.getView(settings.name);
        if (rapidView != null) {
          return rapidView.getPageRoute(settings);
        }
        return null;
      },
    );
  }
}