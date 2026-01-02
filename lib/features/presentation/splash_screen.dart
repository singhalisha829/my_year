import 'dart:ui';
import 'dart:async'; // Import for Timer/Future

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/theme_service.dart';
import 'home_screen.dart';

// --- 1. The Main Screen ---
class NeonYearScreen extends StatefulWidget {
  const NeonYearScreen({Key? key}) : super(key: key);

  @override
  State<NeonYearScreen> createState() => _NeonYearScreenState();
}

class _NeonYearScreenState extends State<NeonYearScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Listen for animation completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });

    _controller.forward();
  }

  void _navigateToNextScreen() async {
    // Optional: Add a small delay so the user sees the final glowing result
    // for a split second before the transition happens.
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    // Replace this with your actual destination screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();

    return Scaffold(
      backgroundColor: themeService.colors.background,
      body: Stack(
        children: [
          // Background Lines
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: NeonLinesPainter(_controller.value),
              );
            },
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rocket Icon
                Container(
                  padding: const EdgeInsets.all(20),
                  child: CustomPaint(
                    size: const Size(100, 100),
                    painter: NeonRocketPainter(),
                  ),
                ),
                // Text
                NeonText(
                  text: 'YEAR',
                  fontSize: 42,
                  color: themeService.colors.neonPrimary,
                  glowColor: themeService.colors.neonPrimary,
                ),
                NeonText(
                  text: 'OF',
                  fontSize: 32,
                  color: themeService.colors.neonPrimary,
                  glowColor: themeService.colors.neonPrimary,
                ),
                NeonText(
                  text: 'ALISHA',
                  fontSize: 52,
                  color: themeService.colors.neonSecondary,
                  glowColor: themeService.colors.neonSecondary,
                  fontWeight: FontWeight.w900,
                ),
                const SizedBox(height: 40),
                Text(
                  'MY 2025 AS A FLUTTER DEVELOPER',
                  style: GoogleFonts.rajdhani(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '[ TOLD IN WIDGETS & BUGS ]',
                  style: GoogleFonts.rajdhani(
                    color: themeService.colors.neonAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- 3. Neon Text Widget (Unchanged) ---
class NeonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color glowColor;
  final FontWeight fontWeight;

  const NeonText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.glowColor,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.orbitron(
            fontSize: fontSize,
            fontWeight: fontWeight,
            textStyle: TextStyle(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = glowColor.withOpacity(0.4)
                ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 15),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.orbitron(
            fontSize: fontSize,
            fontWeight: fontWeight,
            textStyle: TextStyle(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = glowColor.withOpacity(0.9)
                ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 4),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.orbitron(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white,
            shadows: [
              Shadow(
                color: glowColor,
                blurRadius: 10,
                offset: Offset.zero,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- 4. Painters (Unchanged) ---

class NeonLinesPainter extends CustomPainter {
  final double animationValue;
  NeonLinesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final themeService = GetIt.instance<ThemeService>();

    // Define curves
    final curves = [
      // TOP SECTION
      NeonCurve(color: themeService.colors.neonPrimary, startX: -50, startY: 50, controlX1: 10, controlY1: 100, controlX2: 50, controlY2: 50, endX: 50, endY: 0),
      NeonCurve(color: themeService.colors.neonSecondary, startX: -50, startY: 190, controlX1: 50, controlY1: 200, controlX2: 200, controlY2: 100, endX: 100, endY: 0),
      NeonCurve(color: themeService.colors.neonAccent, startX: -50, startY: 300, controlX1: 100, controlY1: 300, controlX2: 300, controlY2: 200, endX: 350, endY: 0),
      NeonCurve(color: themeService.colors.neonAccent, startX: -50, startY: 250, controlX1: size.width * 0.35, controlY1: 180, controlX2: size.width * 0.65, controlY2: 240, endX: size.width + 80, endY: 100),
      NeonCurve(color: themeService.colors.neonPrimary, startX: -80, startY: 220, controlX1: size.width * 0.35, controlY1: 180, controlX2: size.width * 0.65, controlY2: 240, endX: size.width + 80, endY: 200),
      // MID SECTION
      NeonCurve(color: themeService.colors.neonAccent, startX: -50, startY: 300, controlX1: size.width * 0.2, controlY1: 300, controlX2: size.width * 0.4, controlY2: -100, endX: size.width + 120, endY: 130),
      NeonCurve(color: themeService.colors.neonSecondary, startX: -40, startY: 150, controlX1: size.width * 0.45, controlY1: 220, controlX2: size.width * 0.6, controlY2: 160, endX: size.width + 40, endY: 0),
      // RIGHT SECTION
      NeonCurve(color: themeService.colors.neonAccent, startX: size.width - 50, startY: 0, controlX1: size.width - 120, controlY1: 100, controlX2: size.width - 20, controlY2: 100, endX: size.width + 70, endY: 150),
      NeonCurve(color: themeService.colors.neonAccent, startX: size.width - 200, startY: 0, controlX1: size.width - 120, controlY1: 100, controlX2: size.width - 20, controlY2: 100, endX: size.width + 70, endY: 120),
      NeonCurve(color: themeService.colors.neonSecondary, startX: size.width - 200, startY: 0, controlX1: size.width - 50, controlY1: 50, controlX2: size.width - 20, controlY2: 100, endX: size.width + 70, endY: 250),
      // BOTTOM SECTION
      NeonCurve(color: themeService.colors.neonSecondary, startX: -100, startY: size.height - 180, controlX1: size.width * 0.3, controlY1: size.height - 120, controlX2: size.width * 0.6, controlY2: size.height - 220, endX: size.width + 100, endY: size.height - 170),
      NeonCurve(color: themeService.colors.neonAccent, startX: -50, startY: size.height - 300, controlX1: size.width * 0.4, controlY1: size.height - 50, controlX2: size.width * 0.65, controlY2: size.height - 150, endX: size.width + 50, endY: size.height),
      NeonCurve(color: themeService.colors.neonPrimary, startX: -80, startY: size.height - 240, controlX1: size.width * 0.25, controlY1: size.height - 200, controlX2: size.width * 0.7, controlY2: size.height - 280, endX: size.width + 80, endY: size.height + 300),
      NeonCurve(color: themeService.colors.neonSecondary, startX: size.width - 170, startY: size.height, controlX1: size.width * 0.5, controlY1: size.height - 100, controlX2: size.width * 1, controlY2: size.height - 300, endX: size.width + 120, endY: size.height - 70),
      NeonCurve(color: themeService.colors.neonSecondary, startX: size.width - 100, startY: size.height, controlX1: size.width * 0.5, controlY1: size.height - 90, controlX2: size.width, controlY2: size.height - 300, endX: size.width + 120, endY: size.height - 10),
      NeonCurve(color: themeService.colors.neonAccent, startX: -60, startY: size.height - 150, controlX1: size.width * 0.2, controlY1: size.height - 180, controlX2: size.width * 0.75, controlY2: size.height - 120, endX: size.width + 60, endY: size.height * 2),
      NeonCurve(color: themeService.colors.neonSecondary, startX: 0, startY: size.height - 10, controlX1: size.width * 0.3, controlY1: size.height - 170, controlX2: size.width * 0.8, controlY2: size.height - 90, endX: size.width + 90, endY: size.height - 120),
    ];

    for (int i = 0; i < curves.length; i++) {
      final start = i * 0.03;
      final duration = 0.5;

      double lineProgress = (animationValue - start) / duration;
      lineProgress = lineProgress.clamp(0.0, 1.0);

      if (lineProgress > 0) {
        _drawNeonCurve(canvas, size, curves[i], lineProgress);
      }
    }
  }

  void _drawNeonCurve(Canvas canvas, Size size, NeonCurve curve, double progress) {
    final path = Path();
    path.moveTo(curve.startX, curve.startY);
    path.cubicTo(curve.controlX1, curve.controlY1, curve.controlX2, curve.controlY2, curve.endX, curve.endY);

    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      final extractPath = metric.extractPath(0.0, metric.length * progress);

      final glowPaint = Paint()
        ..color = curve.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);
      canvas.drawPath(extractPath, glowPaint);

      final midGlowPaint = Paint()
        ..color = curve.color.withOpacity(0.6)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawPath(extractPath, midGlowPaint);

      final corePaint = Paint()
        ..color = curve.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawPath(extractPath, corePaint);
    }
  }

  @override
  bool shouldRepaint(NeonLinesPainter oldDelegate) => animationValue != oldDelegate.animationValue;
}

class NeonCurve {
  final Color color;
  final double startX, startY, controlX1, controlY1, controlX2, controlY2, endX, endY;
  NeonCurve({required this.color, required this.startX, required this.startY, required this.controlX1, required this.controlY1, required this.controlX2, required this.controlY2, required this.endX, required this.endY});
}

class NeonRocketPainter extends CustomPainter {
  // Same rocket logic as before
  @override
  void paint(Canvas canvas, Size size) {
    final themeService = GetIt.instance<ThemeService>();
    final cx = size.width / 2;
    final cy = size.height / 2;

    _drawNeonShape(canvas, Path()..moveTo(cx - 8, cy + 8)..lineTo(cx - 20, cy + 20)..lineTo(cx - 8, cy + 15)..close(), themeService.colors.neonAccent);
    _drawNeonShape(canvas, Path()..moveTo(cx + 8, cy + 8)..lineTo(cx + 20, cy + 20)..lineTo(cx + 8, cy + 15)..close(), themeService.colors.neonAccent);
    _drawNeonShape(canvas, Path()..moveTo(cx, cy - 25)..lineTo(cx - 12, cy + 12)..lineTo(cx - 12, cy + 12)..lineTo(cx + 12, cy + 12)..close(), themeService.colors.neonPrimary);
    _drawNeonShape(canvas, Path()..addOval(Rect.fromCircle(center: Offset(cx, cy - 5), radius: 7)), themeService.colors.neonSecondary);
    _drawNeonShape(canvas, Path()..moveTo(cx - 8, cy + 12)..lineTo(cx - 5, cy + 28)..lineTo(cx, cy + 22)..close(), themeService.colors.neonAccent);
    _drawNeonShape(canvas, Path()..moveTo(cx + 8, cy + 12)..lineTo(cx + 5, cy + 28)..lineTo(cx, cy + 22)..close(), themeService.colors.neonAccent);
    _drawNeonShape(canvas, Path()..moveTo(cx, cy + 12)..lineTo(cx - 3, cy + 25)..lineTo(cx, cy + 30)..lineTo(cx + 3, cy + 25)..close(), themeService.colors.neonAccent);
  }

  void _drawNeonShape(Canvas canvas, Path path, Color color) {
    canvas.drawPath(path, Paint()..color = color.withOpacity(0.3)..style = PaintingStyle.stroke..strokeWidth = 6..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12));
    canvas.drawPath(path, Paint()..color = color.withOpacity(0.6)..style = PaintingStyle.stroke..strokeWidth = 3..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
    canvas.drawPath(path, Paint()..color = color.withOpacity(0.8)..style = PaintingStyle.fill);
    canvas.drawPath(path, Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(NeonRocketPainter oldDelegate) => false;
}