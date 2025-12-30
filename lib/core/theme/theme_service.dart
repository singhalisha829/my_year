import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:year_of_alisha/core/theme/theme_extension.dart';

import '../const/keys.dart';

enum ThemeType {
  light,
  dark,
}

class ThemeService {
  late SharedPreferences _prefs;

  /// 🌙 Default colors → DARK
  CustomColors _currentColors = CustomColors.dark();
  CustomColors get colors => _currentColors;

  /// 🌙 Default theme → DARK
  final ValueNotifier<ThemeType> _themeTypeNotifier =
  ValueNotifier<ThemeType>(ThemeType.dark);
  ValueNotifier<ThemeType> get themeTypeNotifier => _themeTypeNotifier;
  ThemeType get currentTheme => _themeTypeNotifier.value;

  final ValueNotifier<double> _currentTextScaleNotifier =
  ValueNotifier<double>(1);
  ValueNotifier<double> get currentTextScaleNotifier =>
      _currentTextScaleNotifier;
  double get currentTextScale => _currentTextScaleNotifier.value;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    final savedScale = _prefs.getDouble(Keys.textScaleKey) ?? 1.0;
    _currentTextScaleNotifier.value = savedScale;

    // Get saved theme, default to dark
    final savedThemeName = _prefs.getString(Keys.themeType);

    final themeToUse = savedThemeName != null
        ? ThemeType.values.firstWhere(
          (theme) => theme.name == savedThemeName,
      orElse: () => ThemeType.dark,
    )
        : ThemeType.dark;

    setTheme(themeToUse);
  }

  void setTheme(ThemeType themeType) {
    _themeTypeNotifier.value = themeType;
    _prefs.setString(Keys.themeType, themeType.name);

    switch (themeType) {
      case ThemeType.light:
        _currentColors = CustomColors.light();
        break;
      case ThemeType.dark:
        _currentColors = CustomColors.dark();
        break;
    }
  }

  Future<void> _setSizeScale(double multiplier) async {
    _currentTextScaleNotifier.value = multiplier;
    await _prefs.setDouble(Keys.textScaleKey, multiplier);
  }

  void increaseFontSize() {
    _setSizeScale(_currentTextScaleNotifier.value + 0.1);
  }

  void decreaseFontSize() {
    _setSizeScale(_currentTextScaleNotifier.value - 0.1);
  }

  void toggleTheme() {
    final newTheme = currentTheme == ThemeType.dark
        ? ThemeType.light
        : ThemeType.dark;
    setTheme(newTheme);
  }
}