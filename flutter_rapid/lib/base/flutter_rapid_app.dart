import '../common/rapid_i18n.dart';
import '../common/rapid_system_preference.dart';
import '../flutter_rapid.dart';
import '../logic/rapid_global_state_logic.dart';
import '../widget/rapid_busy_widget.dart';
import '../widget/splash_screen/rapid_splash_screen_logic.dart';
import '../widget/splash_screen/rapid_splash_screen_view.dart';

class FlutterRapidApp extends StatelessWidget {
  FlutterRapidApp({super.key});

  final List<GetPage> _pages = [];
  final RapidI18N _rapidI18N = RapidI18N();

  RapidSystemConfig _sysConf = RapidSystemConfig();
  RapidEnvConfig _envConfig = RapidEnvConfig();

  late RapidGlobalStateLogic globalStateLogic;

  Future<FlutterRapidApp> bStart(RapidSystemConfig sysConf) async {
    WidgetsFlutterBinding.ensureInitialized();
    _sysConf = sysConf;
    await _bStartLogicalDependencies();
    _loadEnvConfig();
    await _miscellaneousInit();
    await _sysConf.onAppStartup();
    _registerModule(_sysConf.modules);
    _initSplash();
    return this;
  }

  void _addViewToPage(RapidView rapidView) {
    _pages.add(rapidView.initView());
    FlutterRapidRegistry.addViewToRegistry(rapidView);
    _rapidI18N.addTranslations(rapidView.getI18n());
  }

  void _registerModule(List<RapidModuleRegistry> modules) {
    for (RapidModuleRegistry moduleRegistry in modules) {
      for (RapidView rapidView in moduleRegistry.getPages()) {
        _addViewToPage(rapidView);
      }
    }
  }

  void _initSplash() {
    globalStateLogic.initialRoute = _sysConf.initialRoute;
    RapidSplashScreenLogic.delayDuration = _sysConf.splashScreenData.delayDuration;
    if(_sysConf.splashScreenData != null && _sysConf.splashScreenData.isEnableSplash && _sysConf.initialRoute != null){
      _addViewToPage(RapidSplashScreenView(_sysConf.splashScreenData));
    }
  }

  Future<void> _bStartLogicalDependencies() async {
    await Get.putAsync(() => RapidPreferenceStore().init(), permanent: true);
    Get.put(RapidSystemPreference(), permanent: true);
    globalStateLogic = Get.put(RapidGlobalStateLogic(), permanent: true);
  }

  void _loadEnvConfig() {
    if (_sysConf.availableEnvironment.containsKey(_sysConf.currentEnv)) {
      var env = _sysConf.availableEnvironment[_sysConf.currentEnv];
      _envConfig = _sysConf.initConfig(env);
    }
  }

  Future<void> _miscellaneousInit() async {
    RLog.enableLog = _envConfig.enableLog;
    RLog.logLevel = _envConfig.logLevel;
  }

  @override
  Widget build(BuildContext context) {
    globalStateLogic.availableLocal = _sysConf.availableLocal;
    return _getUI(context);
  }

  Widget _getUI(BuildContext context) {
    Widget wrappedWidget = Stack(
      children: <Widget>[
        _getMaterialAppUI(context),
        SystemBusyWidgetManager(child: _sysConf.systemBusyWidget),
      ],
    );
    if (_envConfig.enableBanner) {
      wrappedWidget = Banner(
        location: BannerLocation.topEnd,
        message: _envConfig.bannerTitle,
        color: Theme.of(context).primaryColor,
        child: wrappedWidget,
      );
    }

    return Directionality(
      textDirection: _sysConf.textDirection,
      child: SizedBox(
        child: wrappedWidget,
      ),
    );
  }

  String? getInitialRoute() {
    if(_sysConf.splashScreenData != null && _sysConf.splashScreenData.isEnableSplash && _sysConf.initialRoute != null){
      return RapidSplashScreenView.routeName;
    }
    return _sysConf.initialRoute;
  }

  Widget _getMaterialAppUI(BuildContext context) {
    return GetMaterialApp(
      home: _sysConf.home,
      initialRoute: getInitialRoute(),
      title: _sysConf.appTitle,
      theme: _sysConf.theme,
      getPages: _pages,
      darkTheme: _sysConf.darkTheme,
      fallbackLocale: _sysConf.fallbackLocale,
      textDirection: _sysConf.textDirection,
      defaultTransition: _sysConf.defaultTransition,
      translations: _rapidI18N,
      debugShowCheckedModeBanner: false,
      locale: globalStateLogic.getInitLocale(_sysConf.locale),
      themeMode: globalStateLogic.getInitThemeMode(_sysConf.themeMode),
    );
  }
}
