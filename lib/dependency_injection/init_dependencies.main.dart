part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initThemeService();
}

void _initThemeService() {
  serviceLocator.registerSingleton<ThemeService>(ThemeService());
  serviceLocator<ThemeService>().init();
}


