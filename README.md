# Flutter Rapid Development Framework (flutter_rapid)
Flutter Rapid is a Flutter Framework for Rapid Development

## Getting Started

### How to Add Rapid Framework/run project

* Run following command
```
git clone -b dev https://github.com/banglafighter/flutter_rapid.git dependencies
```
* flutter_rapid will be cloned to dependencies folder(can be found in root project)
* cd dependencies/flutter_rapid
* flutter pub get
* Run main.dart to run current project
* Run dependencies/fr_example project to understand framework

### fr_example Framework
* lib/config/app_system_config.dart file contains about app current environment information
* value of currentEnv variable can be used to change environment typefrom availableEnvironment(dev, stage, prod)
* lib/page folder contains every page of app like intro page, home page
* lib/pages/npage folder contains nested pages
* lib/pages/nview folder contains nested view used within pages
* lib/pages/dialog folder contains dialog view used within pages
* lib/pages/repository folder contains data fetching repository class(api, db)
* lib/pages/dto folder contains data structure file

### fr_example App
* App starts from fr_example_main.dart file
* lib/pages/home_view.dart : contains view, routename, dependencies, language
```
import 'package:flutter_rapid/flutter_rapid.dart';
import 'home_i18n.dart';
import 'home_logic.dart';

class HomeView extends RapidView<HomeLogic> {
  static String routeName = "/home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return HomeI18N.getTranslations();
  }
}
```
* Basic nested view file
```
import 'package:flutter_rapid/flutter_rapid.dart';

class HomeView extends RapidBasicView<HomeLogic> {
 
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
* lib/pages/home_logic.dart : contains logical code for view file
```
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../config/app_env.dart';
class HomeLogic extends RapidStartLogic {
  AppEnvConfig config = Get.find();
  
  @override
  void onInit() {
    super.onInit();
  }
}
```
* lib/pages/home_i18n.dart : contains multiple language support
```
class HomeI18N {
  static Map<String, Map<String, String>> getTranslations() {
    return {
      "bn_BD": {
        "change_theme": "থিম পরিবর্তন করুন"
      },
      "en_us": {
        "change_theme": "Change theme",
      },
    };
  }
}

```
* to Register Home Page into App Routing System, open example_app_registry.dart
```
class ExampleAppRegistry extends RapidModuleRegistry {
  @override
  List<RapidView> getPages() {
    return [
      const HomeView(),
    ];
  }
}
```
* To run this app go to fr_example folder and run
```
flutter run -t .\lib\fr_example_main.dart
```
### How to Add Rapid Framework in user app

* Run following command
```
git clone -b dev https://github.com/banglafighter/flutter_rapid.git dependencies
```
* flutter_rapid will be cloned to dependencies folder(can be found in root project)
