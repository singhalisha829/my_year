import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get_it/get_it.dart';

import '../../core/theme/theme_service.dart';

class TimeSpentWhereScreen extends StatefulWidget {
  const TimeSpentWhereScreen({super.key});

  @override
  State<TimeSpentWhereScreen> createState() => _TimeSpentWhereScreenState();
}

class _TimeSpentWhereScreenState extends State<TimeSpentWhereScreen> {
  int? selectedIndex;


  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();

    final List<TimeData> timeData = [
      TimeData(
        label: 'Debugging',
        caption:'I didn’t write bugs. I discovered undocumented features.',
        percentage: 35,
        color: themeService.colors.neonSecondary,
      ),
      TimeData(
        label: 'UI tweaks',
        caption: 'Alignment is a lifestyle, not a task.',
        percentage: 25,
        color: themeService.colors.neonPrimary,
      ),
      TimeData(
        label: 'Reading docs',
        caption: 'The answer was always in the docs. On page 17.',
        percentage: 15,
        color: themeService.colors.neonYellow,
      ),
      TimeData(
        label: 'Waiting for builds',
        caption: 'Great time to rethink life choices.',
        percentage: 10,
        color: themeService.colors.neonOrange,
      ),
      TimeData(
        label: 'Googling errors',
        caption: 'Typed the error. Found myself.',
        percentage: 10,
        color: themeService.colors.neonAccent,
      ),
      TimeData(
        label: 'Actually coding clean code',
        caption: 'Five percent. But it was beautiful.',
        percentage: 5,
        color: themeService.colors.neonPurple,
      ),
    ];

    return Scaffold(
      backgroundColor: themeService.colors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                 Text(
                  'Where My Time Went',
                  style: TextStyle(
                    color: themeService.colors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTapDown: (details) {
                    _handleTap(timeData,details.localPosition);
                  },
                  child: SizedBox(
                    height: 280,
                    width: 280,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          size: const Size(280, 280),
                          painter: DonutChartPainter(
                            timeData,
                            selectedIndex: selectedIndex,
                          ),
                        ),
                        // Percentage labels on the chart
                        ...List.generate(timeData.length, (index) {
                          return _buildPercentageLabel(timeData,index);
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                if (selectedIndex != null)
                  AnimatedOpacity(
                    opacity: selectedIndex != null ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: timeData[selectedIndex!].color.withOpacity(0.5),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: timeData[selectedIndex!].color.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: timeData[selectedIndex!].color,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: timeData[selectedIndex!]
                                          .color
                                          .withOpacity(0.5),
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                timeData[selectedIndex!].label,
                                style:  TextStyle(
                                  color: themeService.colors.textPrimary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${timeData[selectedIndex!].percentage}%',
                            style: TextStyle(
                              color: timeData[selectedIndex!].color,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              '"${timeData[selectedIndex!].caption}"',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Text(
                    'Tap on a segment to see details',
                    style: TextStyle(
                      color: themeService.colors.textMuted,
                      fontSize: 18,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPercentageLabel(List<TimeData> timeData,int index) {
    final data = timeData[index];

    // Calculate the angle for this segment
    final gapAngle = 0.04;
    double startAngle = -math.pi / 2;
    for (int i = 0; i < index; i++) {
      startAngle += (timeData[i].percentage / 100) * 2 * math.pi;
    }
    final sweepAngle = (data.percentage / 100) * 2 * math.pi - gapAngle;
    final middleAngle = startAngle + sweepAngle / 2;

    // Position the label
    final radius = 100.0; // Distance from center
    final x = 140 + radius * math.cos(middleAngle);
    final y = 140 + radius * math.sin(middleAngle);

    return Positioned(
      left: x - 20,
      top: y - 15,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0E27).withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '${data.percentage}%',
          style: TextStyle(
            color: data.color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _handleTap(List<TimeData> timeData,Offset position) {
    final center = const Offset(140, 140);
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;

    // Calculate distance from center
    final distance = math.sqrt(dx * dx + dy * dy);

    // Check if tap is within the donut ring (between inner and outer radius)
    if (distance < 50 || distance > 140) {
      return; // Outside the donut
    }

    // Calculate angle of tap
    var angle = math.atan2(dy, dx);
    angle = (angle + math.pi / 2) % (2 * math.pi);
    if (angle < 0) angle += 2 * math.pi;

    // Find which segment was tapped
    final gapAngle = 0.04;
    double currentAngle = 0;
    for (int i = 0; i < timeData.length; i++) {
      final segmentAngle = (timeData[i].percentage / 100) * 2 * math.pi - gapAngle;
      if (angle >= currentAngle && angle < currentAngle + segmentAngle) {
        setState(() {
          selectedIndex = i;
        });
        return;
      }
      currentAngle += segmentAngle + gapAngle;
    }
  }
}

class TimeData {
  final String label;
  final String caption;
  final int percentage;
  final Color color;

  const TimeData({
    required this.label,
    required this.percentage,
    required this.color,
    required this.caption
  });
}

class DonutChartPainter extends CustomPainter {
  final List<TimeData> data;
  final int? selectedIndex;

  DonutChartPainter(this.data, {this.selectedIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final innerRadius = radius * 0.5;
    final strokeWidth = radius - innerRadius;
    final gapAngle = 0.04; // Gap between segments (in radians)

    double startAngle = -math.pi / 2; // Start from top

    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final sweepAngle = (item.percentage / 100) * 2 * math.pi - gapAngle;
      final isSelected = i == selectedIndex;

      // Draw outer glow
      final glowPaint = Paint()
        ..color = item.color.withOpacity(isSelected ? 0.5 : 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth + (isSelected ? 12 : 8)
        ..strokeCap = StrokeCap.round
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          isSelected ? 15 : 10,
        );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        glowPaint,
      );

      // Draw main arc
      final paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? strokeWidth + 5 : strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle + gapAngle;
    }

    // Draw inner circle (hole in the donut)
    final innerPaint = Paint()
      ..color = const Color(0xFF0A0E27)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, innerRadius, innerPaint);
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}