import 'package:flutter/material.dart';

class AppPalette {
  AppPalette._();

  // ───────────────── BACKGROUNDS ─────────────────

  static const Color darkBackground = Color(0xFF0a0e27);
  static const Color lightBackground = Color(0xFFF7F9FC);

  // ───────────────── NEON CORE ─────────────────

  static const Color neonBlue = Color(0xFF00e5ff);
  static const Color neonPink = Color(0xFFff0080);
  static const Color neonLime = Color(0xFFccff00);
  static const Color neonYellow = Color(0xFFfacc15);
  static const Color neonPurple = Color(0xFF9D4EDD);
  static const Color neonOrange = Color(0xFFFF8500);

  static const Color neonBlueLight = Color(0xFF0288D1);
  static const Color neonPinkLight = Color(0xFFD81B60);
  static const Color neonLimeLight = Color(0xFF9CCC65);
  static const Color neonYellowLight = Color(0xFFEAB308);
  static const Color neonPurpleLight = Color(0xFF7C3AED);
  static const Color neonOrangeLight = Color(0xFFEA580C);

  // ───────────────── RELEASE GRADIENT COLORS (DARK) ─────────────────

  static const Color releaseBlueStart = Color(0xFF667eea);
  static const Color releaseBlueEnd   = Color(0xFF764ba2);

  static const Color releasePinkStart = Color(0xFFf093fb);
  static const Color releasePinkEnd   = Color(0xFFf5576c);

  static const Color releaseCyanStart = Color(0xFF4facfe);
  static const Color releaseCyanEnd   = Color(0xFF00f2fe);

  static const Color releaseGreenStart = Color(0xFF43e97b);
  static const Color releaseGreenEnd   = Color(0xFF38f9d7);

  static const Color releaseYellowStart = Color(0xFFfa709a);
  static const Color releaseYellowEnd   = Color(0xFFfee140);

  static const Color releaseIndigoStart = Color(0xFF30cfd0);
  static const Color releaseIndigoEnd   = Color(0xFF330867);

  // ───────────────── RELEASE GRADIENT COLORS (LIGHT – DARKER) ─────────────────
  // Tuned for contrast on light background

  static const Color releaseBlueStartLight = Color(0xFF5C6BC0); // Indigo 400
  static const Color releaseBlueEndLight   = Color(0xFF7E57C2); // Deep Purple 400

  static const Color releasePinkStartLight = Color(0xFFEC407A); // Pink 400
  static const Color releasePinkEndLight   = Color(0xFFD81B60); // Pink 600

  static const Color releaseCyanStartLight = Color(0xFF42A5F5); // Blue 400
  static const Color releaseCyanEndLight   = Color(0xFF26C6DA); // Cyan 400

  static const Color releaseGreenStartLight = Color(0xFF66BB6A); // Green 400
  static const Color releaseGreenEndLight   = Color(0xFF26A69A); // Teal 400

  static const Color releaseYellowStartLight = Color(0xFFF06292); // Rose 400
  static const Color releaseYellowEndLight   = Color(0xFFFBC02D); // Yellow 700

  static const Color releaseIndigoStartLight = Color(0xFF26C6DA); // Cyan 400
  static const Color releaseIndigoEndLight   = Color(0xFF5E35B1); // Deep Purple 600

  // ───────────────── TEXT ─────────────────

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color darkText = Color(0xFF1E1E1E);
  static const Color mutedText = Color(0xFF6B7280);

  // ───────────────── SHADOWS ─────────────────

  static const Color shadowSoft = Color(0x1A000000);
  static const Color shadowStrong = Color(0x33000000);
}
