import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a0e27),
      body: Stack(
        children: [
          // Animated neon lines background
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
                // Rocket icon
                Container(
                  padding: const EdgeInsets.all(20),
                  child: CustomPaint(
                    size: const Size(100, 100),
                    painter: NeonRocketPainter(),
                  ),
                ),
                const SizedBox(height: 40),
                // Year of text
                NeonText(
                  text: 'Year of',
                  fontSize: 48,
                  color: const Color(0xFF00e5ff),
                  glowColor: const Color(0xFF00e5ff),
                ),
                const SizedBox(height: 10),
                // Alisha text
                NeonText(
                  text: 'Alisha',
                  fontSize: 56,
                  color: const Color(0xFFff0080),
                  glowColor: const Color(0xFFff0080),
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 40),
                // Subtitle
                Text(
                  'My 2025 as a Flutter Developer',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
                Text(
                  '(told in widgets & bugs)',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
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
        // Outer glow
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 8
              ..color = glowColor.withOpacity(0.3)
              ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 20),
          ),
        ),
        // Middle glow
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = glowColor.withOpacity(0.6)
              ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 10),
          ),
        ),
        // Main text
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ],
    );
  }
}

class NeonLinesPainter extends CustomPainter {
  final double animationValue;

  NeonLinesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final curves = [
      // Top area curves
      NeonCurve(
        color: const Color(0xFF00e5ff),
        startX: -50,
        startY: 50,
        controlX1: 10,
        controlY1: 100,
        controlX2: 50,
        controlY2: 50,
        endX: 50,
        endY: 0,
      ),
      NeonCurve(
        color: const Color(0xFFff0080),
        startX: -50,
        startY: 190,
        controlX1: 50,
        controlY1: 200,
        controlX2: 200,
        controlY2: 100,
        endX: 100,
        endY: 0,
      ),
      NeonCurve(
        color: const Color(0xFFccff00),
        startX: -50,
        startY: 300,
        controlX1: 100,
        controlY1: 300,
        controlX2: 300,
        controlY2: 200,
        endX: 350,
        endY: 0,
      ),
      NeonCurve(
        color: const Color(0xFFccff00),
        startX: -50,
        startY: 250,
        controlX1: size.width * 0.35,
        controlY1: 180,
        controlX2: size.width * 0.65,
        controlY2: 240,
        endX: size.width + 80,
        endY: 100,
      ),
      NeonCurve(
        color: const Color(0xFF00e5ff),
        startX: -80,
        startY: 220,
        controlX1: size.width * 0.35,
        controlY1: 180,
        controlX2: size.width * 0.65,
        controlY2: 240,
        endX: size.width + 80,
        endY: 200,
      ),
      NeonCurve(
        color: const Color(0xFFccff00),
        startX: -50,
        startY: 300,
        controlX1: size.width * 0.2,
        controlY1: 260,
        controlX2: size.width * 0.8,
        controlY2: 20,
        endX: size.width + 120,
        endY: 130,
      ),

      // Bottom area curves
      NeonCurve(
        color: const Color(0xFFff0080),
        startX: -100,
        startY: size.height - 180,
        controlX1: size.width * 0.3,
        controlY1: size.height - 120,
        controlX2: size.width * 0.6,
        controlY2: size.height - 220,
        endX: size.width + 100,
        endY: size.height - 170,
      ),
      NeonCurve(
        color: const Color(0xFFccff00),
        startX: -50,
        startY: size.height - 100,
        controlX1: size.width * 0.4,
        controlY1: size.height - 50,
        controlX2: size.width * 0.65,
        controlY2: size.height - 150,
        endX: size.width + 50,
        endY: size.height - 90,
      ),
      NeonCurve(
        color: const Color(0xFF00e5ff),
        startX: -80,
        startY: size.height - 240,
        controlX1: size.width * 0.25,
        controlY1: size.height - 200,
        controlX2: size.width * 0.7,
        controlY2: size.height - 280,
        endX: size.width + 80,
        endY: size.height - 230,
      ),
      NeonCurve(
        color: const Color(0xFFff0080),
        startX: -120,
        startY: size.height - 60,
        controlX1: size.width * 0.35,
        controlY1: size.height - 30,
        controlX2: size.width * 0.6,
        controlY2: size.height - 100,
        endX: size.width + 120,
        endY: size.height - 50,
      ),
      NeonCurve(
        color: const Color(0xFFccff00),
        startX: -60,
        startY: size.height - 150,
        controlX1: size.width * 0.5,
        controlY1: size.height - 180,
        controlX2: size.width * 0.75,
        controlY2: size.height - 120,
        endX: size.width + 60,
        endY: size.height - 140,
      ),
      NeonCurve(
        color: const Color(0xFF00e5ff),
        startX: -90,
        startY: size.height - 130,
        controlX1: size.width * 0.3,
        controlY1: size.height - 170,
        controlX2: size.width * 0.8,
        controlY2: size.height - 90,
        endX: size.width + 90,
        endY: size.height - 120,
      ),

      // Additional crossing lines
      NeonCurve(
        color: const Color(0xFFff0080),
        startX: -40,
        startY: 190,
        controlX1: size.width * 0.45,
        controlY1: 220,
        controlX2: size.width * 0.6,
        controlY2: 160,
        endX: size.width + 40,
        endY: 180,
      ),
      NeonCurve(
        color: const Color(0xFFccff00),
        startX: -70,
        startY: 60,
        controlX1: size.width * 0.5,
        controlY1: 90,
        controlX2: size.width * 0.7,
        controlY2: 40,
        endX: size.width + 70,
        endY: 70,
      ),
    ];

    for (var curve in curves) {
      _drawNeonCurve(canvas, size, curve);
    }
  }

  void _drawNeonCurve(Canvas canvas, Size size, NeonCurve curve) {
    final path = Path();
    path.moveTo(curve.startX, curve.startY);
    path.cubicTo(
      curve.controlX1,
      curve.controlY1,
      curve.controlX2,
      curve.controlY2,
      curve.endX,
      curve.endY,
    );

    // Outer glow
    final glowPaint = Paint()
      ..color = curve.color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);
    canvas.drawPath(path, glowPaint);

    // Middle glow
    final midGlowPaint = Paint()
      ..color = curve.color.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawPath(path, midGlowPaint);

    // Core line
    final corePaint = Paint()
      ..color = curve.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, corePaint);
  }

  @override
  bool shouldRepaint(NeonLinesPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue;
  }
}

class NeonCurve {
  final Color color;
  final double startX, startY;
  final double controlX1, controlY1;
  final double controlX2, controlY2;
  final double endX, endY;

  NeonCurve({
    required this.color,
    required this.startX,
    required this.startY,
    required this.controlX1,
    required this.controlY1,
    required this.controlX2,
    required this.controlY2,
    required this.endX,
    required this.endY,
  });
}

class NeonRocketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Draw fins (yellow-green)
    final leftFinPath = Path();
    leftFinPath.moveTo(cx - 8, cy + 8);
    leftFinPath.lineTo(cx - 20, cy + 20);
    leftFinPath.lineTo(cx - 8, cy + 15);
    leftFinPath.close();

    _drawNeonShape(
      canvas,
      leftFinPath,
      const Color(0xFFccff00),
    );

    final rightFinPath = Path();
    rightFinPath.moveTo(cx + 8, cy + 8);
    rightFinPath.lineTo(cx + 20, cy + 20);
    rightFinPath.lineTo(cx + 8, cy + 15);
    rightFinPath.close();

    _drawNeonShape(
      canvas,
      rightFinPath,
      const Color(0xFFccff00),
    );

    // Draw rocket body (cyan)
    final bodyPath = Path();
    bodyPath.moveTo(cx, cy - 25);
    bodyPath.lineTo(cx - 12, cy + 12);
    bodyPath.lineTo(cx - 12, cy + 12);
    bodyPath.lineTo(cx + 12, cy + 12);
    bodyPath.close();

    _drawNeonShape(
      canvas,
      bodyPath,
      const Color(0xFF00e5ff),
    );

    // Draw window (magenta circle)
    final windowPath = Path();
    windowPath.addOval(Rect.fromCircle(
      center: Offset(cx, cy - 5),
      radius: 7,
    ));

    _drawNeonShape(
      canvas,
      windowPath,
      const Color(0xFFff0080),
    );

    // Draw flame (yellow-green)
    final flamePath = Path();
    flamePath.moveTo(cx - 8, cy + 12);
    flamePath.lineTo(cx - 5, cy + 28);
    flamePath.lineTo(cx, cy + 22);
    flamePath.close();

    _drawNeonShape(
      canvas,
      flamePath,
      const Color(0xFFccff00),
    );

    final flamePath2 = Path();
    flamePath2.moveTo(cx + 8, cy + 12);
    flamePath2.lineTo(cx + 5, cy + 28);
    flamePath2.lineTo(cx, cy + 22);
    flamePath2.close();

    _drawNeonShape(
      canvas,
      flamePath2,
      const Color(0xFFccff00),
    );

    final flameCenter = Path();
    flameCenter.moveTo(cx, cy + 12);
    flameCenter.lineTo(cx - 3, cy + 25);
    flameCenter.lineTo(cx, cy + 30);
    flameCenter.lineTo(cx + 3, cy + 25);
    flameCenter.close();

    _drawNeonShape(
      canvas,
      flameCenter,
      const Color(0xFFccff00),
    );
  }

  void _drawNeonShape(Canvas canvas, Path path, Color color) {
    // Outer glow
    final glowPaint = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
    canvas.drawPath(path, glowPaint);

    // Middle glow
    final midGlowPaint = Paint()
      ..color = color.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawPath(path, midGlowPaint);

    // Fill
    final fillPaint = Paint()
      ..color = color.withOpacity(0.8)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // Core outline
    final corePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, corePaint);
  }

  @override
  bool shouldRepaint(NeonRocketPainter oldDelegate) => false;
}