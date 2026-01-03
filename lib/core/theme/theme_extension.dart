import 'package:flutter/material.dart';

import 'app_pallete.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color background;
  final Color neonPrimary;
  final Color neonSecondary;
  final Color neonAccent;
  final Color neonYellow;
  final Color neonOrange;
  final Color neonPurple;

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;

  final Color shadowSoft;
  final Color shadowStrong;

  final Color releaseBlueStart;
  final Color releaseBlueEnd;

  final Color releasePinkStart;
  final Color releasePinkEnd;

  final Color releaseCyanStart;
  final Color releaseCyanEnd;

  final Color releaseGreenStart;
  final Color releaseGreenEnd;

  final Color releaseYellowStart;
  final Color releaseYellowEnd;

  final Color releaseIndigoStart;
  final Color releaseIndigoEnd;

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
    required this.neonOrange,
    required this.neonPurple,
    required this.neonYellow,
    required this.releaseBlueStart,
    required this.releaseBlueEnd,
    required this.releasePinkStart,
    required this.releasePinkEnd,
    required this.releaseCyanStart,
    required this.releaseCyanEnd,
    required this.releaseGreenStart,
    required this.releaseGreenEnd,
    required this.releaseYellowStart,
    required this.releaseYellowEnd,
    required this.releaseIndigoStart,
    required this.releaseIndigoEnd,
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
    neonYellow: AppPalette.neonYellowLight,
    neonPurple: AppPalette.neonPurpleLight,
    neonOrange: AppPalette.neonOrangeLight,
    releaseBlueStart: AppPalette.releaseBlueStartLight,
    releaseBlueEnd: AppPalette.releaseBlueEndLight,
    releasePinkStart: AppPalette.releasePinkStartLight,
    releasePinkEnd: AppPalette.releasePinkEndLight,
    releaseCyanStart: AppPalette.releaseCyanStartLight,
    releaseCyanEnd: AppPalette.releaseCyanEndLight,
    releaseGreenStart: AppPalette.releaseGreenStartLight,
    releaseGreenEnd: AppPalette.releaseGreenEndLight,
    releaseYellowStart: AppPalette.releaseYellowStartLight,
    releaseYellowEnd: AppPalette.releaseYellowEndLight,
    releaseIndigoStart: AppPalette.releaseIndigoStartLight,
    releaseIndigoEnd: AppPalette.releaseIndigoEndLight,
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
    neonOrange: AppPalette.neonOrange,
    neonPurple: AppPalette.neonPurple,
    neonYellow: AppPalette.neonYellow,
    releaseBlueStart: AppPalette.releaseBlueStart,
    releaseBlueEnd: AppPalette.releaseBlueEnd,
    releasePinkStart: AppPalette.releasePinkStart,
    releasePinkEnd: AppPalette.releasePinkEnd,
    releaseCyanStart: AppPalette.releaseCyanStart,
    releaseCyanEnd: AppPalette.releaseCyanEnd,
    releaseGreenStart: AppPalette.releaseGreenStart,
    releaseGreenEnd: AppPalette.releaseGreenEnd,
    releaseYellowStart: AppPalette.releaseYellowStart,
    releaseYellowEnd: AppPalette.releaseYellowEnd,
    releaseIndigoStart: AppPalette.releaseIndigoStart,
    releaseIndigoEnd: AppPalette.releaseIndigoEnd,
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
    Color? neonYellow,
    Color? neonPurple,
    Color? neonOrange,
    Color? releaseBlueStart,
    Color? releaseBlueEnd,
    Color? releasePinkStart,
    Color? releasePinkEnd,
    Color? releaseCyanStart,
    Color? releaseCyanEnd,
    Color? releaseGreenStart,
    Color? releaseGreenEnd,
    Color? releaseYellowStart,
    Color? releaseYellowEnd,
    Color? releaseIndigoStart,
    Color? releaseIndigoEnd,
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
      neonOrange: neonOrange ?? this.neonOrange,
      neonPurple: neonPurple ?? this.neonPurple,
      neonYellow: neonYellow ?? this.neonYellow,
      releaseBlueStart: releaseBlueStart ?? this.releaseBlueStart,
      releaseBlueEnd: releaseBlueEnd ?? this.releaseBlueEnd,
      releasePinkStart: releasePinkStart ?? this.releasePinkStart,
      releasePinkEnd: releasePinkEnd ?? this.releasePinkEnd,
      releaseCyanStart: releaseCyanStart ?? this.releaseCyanStart,
      releaseCyanEnd: releaseCyanEnd ?? this.releaseCyanEnd,
      releaseGreenStart: releaseGreenStart ?? this.releaseGreenStart,
      releaseGreenEnd: releaseGreenEnd ?? this.releaseGreenEnd,
      releaseYellowStart: releaseYellowStart ?? this.releaseYellowStart,
      releaseYellowEnd: releaseYellowEnd ?? this.releaseYellowEnd,
      releaseIndigoStart: releaseIndigoStart ?? this.releaseIndigoStart,
      releaseIndigoEnd: releaseIndigoEnd ?? this.releaseIndigoEnd,

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
      neonYellow: Color.lerp(neonYellow, other.neonYellow, t)!,
      neonPurple: Color.lerp(neonPurple, other.neonPurple, t)!,
      neonOrange: Color.lerp(neonOrange, other.neonOrange, t)!,
      releaseBlueStart:
      Color.lerp(releaseBlueStart, other.releaseBlueStart, t)!,
      releaseBlueEnd:
      Color.lerp(releaseBlueEnd, other.releaseBlueEnd, t)!,
      releasePinkStart:
      Color.lerp(releasePinkStart, other.releasePinkStart, t)!,
      releasePinkEnd:
      Color.lerp(releasePinkEnd, other.releasePinkEnd, t)!,
      releaseCyanStart:
      Color.lerp(releaseCyanStart, other.releaseCyanStart, t)!,
      releaseCyanEnd:
      Color.lerp(releaseCyanEnd, other.releaseCyanEnd, t)!,
      releaseGreenStart:
      Color.lerp(releaseGreenStart, other.releaseGreenStart, t)!,
      releaseGreenEnd:
      Color.lerp(releaseGreenEnd, other.releaseGreenEnd, t)!,
      releaseYellowStart:
      Color.lerp(releaseYellowStart, other.releaseYellowStart, t)!,
      releaseYellowEnd:
      Color.lerp(releaseYellowEnd, other.releaseYellowEnd, t)!,
      releaseIndigoStart:
      Color.lerp(releaseIndigoStart, other.releaseIndigoStart, t)!,
      releaseIndigoEnd:
      Color.lerp(releaseIndigoEnd, other.releaseIndigoEnd, t)!,
    );
  }
}
