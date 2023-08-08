import 'package:flutter_rapid/flutter_rapid.dart';
import 'page/home/home_view.dart';

class ExampleAppRegistry extends RapidModuleRegistry {
  @override
  List<RapidView> getPages() {
    return [
      const HomeView(),
    ];
  }
}
