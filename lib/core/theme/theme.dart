import 'package:flutter/material.dart';

import '../const/sizes.dart';
import 'app_pallete.dart';

/// AppTheme manages the application's theme configurations
/// Provides light, dark and custom theme modes with consistent styling
class AppTheme {
  // MARK: - Common Theme Elements

  /// Creates a standard border with customizable color
  /// Used for input fields and other bordered components
  static OutlineInputBorder _createBorder({
    Color color = AppPalette.primary,
    double width = 2,
    double borderRadius = 4,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  /// Shared text theme used across all theme modes
  /// Establishes consistent typography with the IBM Plex Sans font family
  static TextTheme _createBaseTextTheme({Color bodyTextColor = Colors.black}) {
    return ThemeData.light().textTheme.copyWith(
      bodySmall: TextStyle(fontSize: 11, color: bodyTextColor),
      bodyMedium: TextStyle(fontSize: 12, color: bodyTextColor),
      bodyLarge: TextStyle(fontSize: 14, color: bodyTextColor),

      displaySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: bodyTextColor),
      displayMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: bodyTextColor),
      displayLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: bodyTextColor),

      titleSmall: TextStyle(fontSize: 14, color: bodyTextColor),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: bodyTextColor),
      titleLarge: TextStyle(fontSize: 20, color: bodyTextColor),

      labelSmall: TextStyle(fontSize: 14, color: bodyTextColor),
      labelMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: bodyTextColor),
      labelLarge: TextStyle(fontSize: 20, color: bodyTextColor),

      headlineSmall: TextStyle(fontSize: 22, color: bodyTextColor),
      headlineMedium: TextStyle(fontSize: 24, color: bodyTextColor),
      headlineLarge: TextStyle(fontSize: 28, color: bodyTextColor),
    ).apply(
      fontFamily: 'IBMPlexSans',
    );
  }

  /// Shared app bar theme used across all theme modes
  /// Creates consistent app bar styling
  static AppBarTheme _createAppBarTheme() {
    return AppBarTheme(
      backgroundColor: AppPalette.white,
      titleTextStyle: TextStyle(
        color: AppPalette.primary,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'IBMPlexSans',
      ),
    );
  }

  /// Creates a consistent input decoration theme
  /// Customizable for different theme modes
  static InputDecorationTheme _createInputDecorationTheme({
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(KSizes.defaultCompactSpacing),
    Color enabledBorderColor = AppPalette.primary,
    Color focusedBorderColor = AppPalette.primary,
    Color textColor = AppPalette.primary,
    Color fillColor = AppPalette.white
  }) {
    return InputDecorationTheme(
      contentPadding: contentPadding,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: enabledBorderColor,
          width: 1,
        ),
      ),
      disabledBorder: _createBorder(),
      errorBorder: _createBorder(color: AppPalette.textRed),
      focusedErrorBorder: _createBorder(color: AppPalette.textRed),
      focusedBorder: _createBorder(color: focusedBorderColor),
      floatingLabelStyle: TextStyle(
        color: textColor,
        fontFamily: 'IBMPlexSans',
      ),
      counterStyle: TextStyle(color: textColor),
      helperStyle: TextStyle(color: textColor),
      hintStyle: const TextStyle(
        color: AppPalette.warmGrey400,
        fontFamily: 'IBMPlexSans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelStyle: const TextStyle(
        color: AppPalette.warmGrey400,
        fontFamily: 'IBMPlexSans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      prefixStyle: TextStyle(
        color: Colors.black,
      ),
      filled: true,
      fillColor: fillColor,
    );
  }

  /// Creates a consistent elevated button theme
  /// Customizable for different theme modes
  static ElevatedButtonThemeData _createElevatedButtonTheme({
    Color backgroundColor = AppPalette.primary,
    Color textColor = AppPalette.white,
    Color disabledColor = AppPalette.primary,
    Color disabledTextColor = AppPalette.white,
    double height = 38,
  }) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          AppPalette.bottomSheetBarrierColor.withAlpha(11),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          Size.fromHeight(height),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledColor.withValues(alpha: 0.5);
            }
            return backgroundColor;
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return disabledTextColor;
            }
            return textColor;
          },
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
            return TextStyle(
              fontSize: 16,
              fontFamily: 'IBMPlexSans',
            );
          },
        ),
      ),
    );
  }

  /// Creates a consistent outlined button theme
  /// Used across all theme modes
  static OutlinedButtonThemeData _createOutlinedButtonTheme({
    double height = 38,
    double borderRadius = 4.0,
    FontWeight fontWeight = FontWeight.w600,
    Color textColor = AppPalette.primary
  }) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          AppPalette.bottomSheetBarrierColor.withAlpha(11),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: textColor, width: 1),
        ),
        fixedSize: WidgetStateProperty.all<Size>(
          Size.fromHeight(height),
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
            return TextStyle(
              fontSize: 16,
              fontWeight: fontWeight,
              color: textColor,
              fontFamily: 'IBMPlexSans',
            );
          },
        ),
        iconColor: WidgetStatePropertyAll(textColor),
        foregroundColor: WidgetStatePropertyAll(textColor),
      ),
    );
  }

  /// Creates a consistent card theme
  /// Used for card widgets across the app
  static CardThemeData _createCardTheme() {
    return CardThemeData(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
    );
  }

  /// Creates a consistent checkbox theme
  /// Used for checkbox widgets across the app
  static CheckboxThemeData _createCheckboxTheme({Color selectedColor=AppPalette.primary}) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return selectedColor;
        }
        return AppPalette.transparent;
      }),
      side: BorderSide(
        color: AppPalette.warmGrey600,
        width: 1.5,
      ),
      checkColor: WidgetStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  /// Creates a consistent switch theme
  /// Used for switch widgets across the app
  static SwitchThemeData _createSwitchTheme() {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppPalette.warmGrey100;
      }),
      trackOutlineWidth: WidgetStatePropertyAll(0),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppPalette.primary;
        }
        return AppPalette.warmGrey200;
      }),
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
    );
  }

  // MARK: - Theme Modes

  /// Light theme configuration
  /// The primary theme mode for the application
  static final lightThemeMode = ThemeData.light().copyWith(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppPalette.primary,
      onPrimary: AppPalette.white,
      secondary: AppPalette.warmGrey700,
      onSecondary: AppPalette.white,
      error: AppPalette.textRed,
      onError: AppPalette.white,
      surface: AppPalette.warmGrey100,
      onSurface: AppPalette.warmGrey700,
    ),
    dividerColor: AppPalette.warmGrey300,
    unselectedWidgetColor: AppPalette.warmGrey400,
    scaffoldBackgroundColor: AppPalette.white,
    appBarTheme: _createAppBarTheme(),
    textTheme: _createBaseTextTheme(bodyTextColor: AppPalette.primary),
    inputDecorationTheme: _createInputDecorationTheme(),
    elevatedButtonTheme: _createElevatedButtonTheme(),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          AppPalette.bottomSheetBarrierColor.withAlpha(11),
        ),
      ),
    ),
    outlinedButtonTheme: _createOutlinedButtonTheme(
        borderRadius: 6.0,
        fontWeight: FontWeight.w400
    ),
    cardTheme: _createCardTheme(),
    checkboxTheme: _createCheckboxTheme(),
    switchTheme: _createSwitchTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppPalette.primary,
      unselectedItemColor: AppPalette.warmGrey600,
      backgroundColor: AppPalette.white,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: AppPalette.primary,
        height: 2,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: AppPalette.warmGrey600,
        height: 2,
      ),
    ),
  );

  /// Dark theme configuration
  /// Alternative theme mode with darker color scheme
  static final darkThemeMode = ThemeData.dark().copyWith(
    unselectedWidgetColor: AppPalette.warmGrey400,
    scaffoldBackgroundColor: AppPalette.white,
    appBarTheme: _createAppBarTheme(),
    textTheme: _createBaseTextTheme(bodyTextColor: Colors.white),
    inputDecorationTheme: _createInputDecorationTheme(
      contentPadding: const EdgeInsets.all(KSizes.defaultSpacing),
      enabledBorderColor: AppPalette.white,
      focusedBorderColor: AppPalette.white,
      fillColor: AppPalette.black,
      textColor: Color(0xFF1E1E1E)
    ),
    elevatedButtonTheme: _createElevatedButtonTheme(
      backgroundColor: AppPalette.lighterDarkGrey,
      disabledTextColor: AppPalette.white.withValues(alpha: 0.3),
      disabledColor: Color(0xFF4A4A4A)
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          AppPalette.bottomSheetBarrierColor.withAlpha(11),
        ),
      ),
    ),
    outlinedButtonTheme: _createOutlinedButtonTheme(textColor: Colors.white),
    cardTheme: _createCardTheme(),
    checkboxTheme: _createCheckboxTheme(selectedColor: AppPalette.mediumDarkGrey),
    switchTheme: _createSwitchTheme(),
  );

  /// Pink theme configuration
  /// Custom theme mode with pink accent colors
  static final pinkThemeMode = ThemeData.dark().copyWith(
    unselectedWidgetColor: AppPalette.warmGrey400,
    scaffoldBackgroundColor: AppPalette.white,
    appBarTheme: _createAppBarTheme(),
    textTheme: _createBaseTextTheme(bodyTextColor: Colors.pink),
    inputDecorationTheme: _createInputDecorationTheme(
      contentPadding: const EdgeInsets.all(KSizes.defaultSpacing),
      enabledBorderColor: AppPalette.warmGrey300,
      focusedBorderColor: Colors.pink,
    ),
    elevatedButtonTheme: _createElevatedButtonTheme(
      backgroundColor: Colors.pink,
      height: 48,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          AppPalette.bottomSheetBarrierColor.withAlpha(11),
        ),
      ),
    ),
    outlinedButtonTheme: _createOutlinedButtonTheme(),
    cardTheme: _createCardTheme(),
    checkboxTheme: _createCheckboxTheme(),
    switchTheme: _createSwitchTheme(),
  );
}