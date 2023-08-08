import 'fr_core.dart';


abstract class RapidBasicView<T> extends GetView<T> {
  const RapidBasicView({Key? key}) : super(key: key);
}

abstract class RapidView<T> extends GetView<T> {
  const RapidView({Key? key}) : super(key: key);

  void loadDependentLogics();

  String getRouteName();

  Map<String, Map<String, String>> getI18n();

  GetPageRoute getPageRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      routeName: this.getRouteName(),
      page: () => this,
      binding: BindingsBuilder(
        () {
          this.loadDependentLogics();
        },
      ),
    );
  }

  GetPage initView() {
    GetPage page = GetPage(
      name: this.getRouteName(),
      page: () => this,
      binding: BindingsBuilder(
        () {
          this.loadDependentLogics();
        },
      ),
    );
    return this.modifyPage(page);
  }

  GetPage modifyPage(GetPage page) {
    return page;
  }
}