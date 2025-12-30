import 'package:flutter/material.dart';

import 'app_pallete.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color background;
  final Color neonPrimary;
  final Color neonSecondary;
  final Color neonAccent;

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;

  final Color shadowSoft;
  final Color shadowStrong;

  const CustomColors({
    required this.background,
    required this.neonPrimary,
    required this.neonSecondary,
    required this.neonAccent,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.shadowSoft,
    required this.shadowStrong,
  });

  // Light theme factory
  factory CustomColors.light() => const CustomColors(
    background: AppPalette.lightBackground,

    neonPrimary: AppPalette.neonBlueLight,
    neonSecondary: AppPalette.neonPinkLight,
    neonAccent: AppPalette.neonLimeLight,

    textPrimary: AppPalette.darkText,
    textSecondary: AppPalette.mutedText,
    textMuted: Color(0xFF9CA3AF),

    shadowSoft: AppPalette.shadowSoft,
    shadowStrong: AppPalette.shadowStrong,
  );

  // Dark theme factory
  factory CustomColors.dark() => const CustomColors(
    background: AppPalette.darkBackground,

    neonPrimary: AppPalette.neonBlue,
    neonSecondary: AppPalette.neonPink,
    neonAccent: AppPalette.neonLime,

    textPrimary: AppPalette.white,
    textSecondary: Color(0xB3FFFFFF), // 70% white
    textMuted: Color(0x80FFFFFF), // 50% white

    shadowSoft: Color(0x33000000),
    shadowStrong: Color(0x66000000),
  );


  @override
  CustomColors copyWith({
    Color? background,
    Color? neonPrimary,
    Color? neonSecondary,
    Color? neonAccent,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? shadowSoft,
    Color? shadowStrong,
  }) {
    return CustomColors(
      background: background ?? this.background,
      neonPrimary: neonPrimary ?? this.neonPrimary,
      neonSecondary: neonSecondary ?? this.neonSecondary,
      neonAccent: neonAccent ?? this.neonAccent,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      shadowSoft: shadowSoft ?? this.shadowSoft,
      shadowStrong: shadowStrong ?? this.shadowStrong,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;

    return CustomColors(
      background: Color.lerp(background, other.background, t)!,
      neonPrimary: Color.lerp(neonPrimary, other.neonPrimary, t)!,
      neonSecondary: Color.lerp(neonSecondary, other.neonSecondary, t)!,
      neonAccent: Color.lerp(neonAccent, other.neonAccent, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      shadowSoft: Color.lerp(shadowSoft, other.shadowSoft, t)!,
      shadowStrong: Color.lerp(shadowStrong, other.shadowStrong, t)!,
    );
  }
}
