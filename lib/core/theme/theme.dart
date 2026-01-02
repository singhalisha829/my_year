import 'package:flutter/material.dart';
import 'package:year_of_alisha/core/theme/theme_extension.dart';
import '../const/sizes.dart';
import 'app_pallete.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ───────────────── COMMON ─────────────────

  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  static TextTheme _baseTextTheme(Color color) {
    return GoogleFonts.outfitTextTheme(
      ThemeData.light().textTheme.apply(
        bodyColor: color,
        displayColor: color,
      ),
    );
  }

  static AppBarTheme _appBar(Color bg, Color text) {
    return AppBarTheme(
      backgroundColor: bg,
      elevation: 0,
      titleTextStyle: GoogleFonts.outfit(
        color: text,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: text),
    );
  }

  // ───────────────── INPUT ─────────────────

  static InputDecorationTheme _inputTheme(CustomColors c) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.all(KSizes.defaultCompactSpacing),
      filled: true,
      fillColor: c.background,
      enabledBorder: _border(c.textMuted),
      focusedBorder: _border(c.neonPrimary),
      hintStyle: TextStyle(color: c.textMuted),
      labelStyle: TextStyle(color: c.textSecondary),
    );
  }

  // ───────────────── BUTTONS ─────────────────

  static ElevatedButtonThemeData _elevatedBtn(CustomColors c) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: c.neonPrimary,
        foregroundColor: c.background,
        fixedSize: const Size.fromHeight(40),
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'IBMPlexSans',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedBtn(CustomColors c) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: c.neonPrimary,
        side: BorderSide(color: c.neonPrimary),
        fixedSize: const Size.fromHeight(40),
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: 'IBMPlexSans',
        ),
      ),
    );
  }

  // ───────────────── CARDS / TOGGLES ─────────────────

  static CardTheme _cardTheme(CustomColors c) {
    return CardTheme(
      color: c.background,
      elevation: 6,
      shadowColor: c.shadowSoft,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  static CheckboxThemeData _checkbox(CustomColors c) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
            ? c.neonPrimary
            : Colors.transparent,
      ),
      checkColor: WidgetStateProperty.all(c.background),
      side: BorderSide(color: c.textMuted),
    );
  }

  static SwitchThemeData _switch(CustomColors c) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.all(c.background),
      trackColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected)
            ? c.neonPrimary
            : c.textMuted,
      ),
    );
  }

  // ───────────────── LIGHT THEME ─────────────────

  static ThemeData lightThemeMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPalette.lightBackground,
    textTheme: _baseTextTheme(AppPalette.darkText),
    appBarTheme: _appBar(
      AppPalette.lightBackground,
      AppPalette.darkText,
    ),
    extensions: [
      CustomColors.light(),
    ],
  ).copyWith(
    inputDecorationTheme: _inputTheme(CustomColors.light()),
    elevatedButtonTheme: _elevatedBtn(CustomColors.light()),
    outlinedButtonTheme: _outlinedBtn(CustomColors.light()),
    // cardTheme: _cardTheme(CustomColors.light()),
    checkboxTheme: _checkbox(CustomColors.light()),
    switchTheme: _switch(CustomColors.light()),
  );

  // ───────────────── DARK THEME ─────────────────

  static ThemeData darkThemeMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppPalette.darkBackground,
    textTheme: _baseTextTheme(AppPalette.white),
    appBarTheme: _appBar(
      AppPalette.darkBackground,
      AppPalette.white,
    ),
    extensions: [
      CustomColors.dark(),
    ],
  ).copyWith(
    inputDecorationTheme: _inputTheme(CustomColors.dark()),
    elevatedButtonTheme: _elevatedBtn(CustomColors.dark()),
    outlinedButtonTheme: _outlinedBtn(CustomColors.dark()),
    // cardTheme: _cardTheme(CustomColors.dark()),
    checkboxTheme: _checkbox(CustomColors.dark()),
    switchTheme: _switch(CustomColors.dark()),
  );
}
