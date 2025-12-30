import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:year_of_alisha/features/presentation/splash_screen.dart';

import 'core/theme/theme.dart';
import 'core/theme/theme_service.dart';
import 'dependency_injection/init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();
    return ValueListenableBuilder(
      valueListenable: themeService.themeTypeNotifier,
      builder: (context, themeType, child) {
        late ThemeData themeData;
        switch (themeType) {
          case ThemeType.light:
            themeData = AppTheme.lightThemeMode;
            break;
          case ThemeType.dark:
            themeData = AppTheme.darkThemeMode;
            break;
        }

        return MaterialApp(
          title: 'Year of Alisha',
          theme: themeData,
          debugShowCheckedModeBanner: false,
          home: const NeonYearScreen(),
        );
      }
    );
  }
}