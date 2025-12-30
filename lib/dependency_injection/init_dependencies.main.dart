part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerSingleton<ThemeService>(ThemeService());
  await serviceLocator<ThemeService>().init();
}




