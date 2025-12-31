import 'package:flutter/material.dart';

class BuiltVsBrokeMeScreen extends StatelessWidget {
  const BuiltVsBrokeMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text(
                'Screens I Built vs Screens That Broke Me',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _buildCard(
                        title: 'Built Proudly',
                        subtitle: 'The screens that made me feel like I knew what I was doing',
                        items: [
                          '📹 Video Call Preview & Entry Flow',
                          '✏️ Custom Drawing Widget',
                          '🎨 Theme System (Light / Dark)',
                        ],
                        isPositive: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: _buildCard(
                        title: 'Broke Me',
                        subtitle: 'The screens and systems that tested my patience',
                        items: [
                          '🖨️ Printing on Windows',
                          '🔔 Background FCM Handling',
                          '🧩 Platform-Specific Bugs',
                        ],
                        isPositive: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required List<String> items,
    required bool isPositive,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: isPositive
                ? const Color(0xFF00FF87).withOpacity(0.5)
                : const Color(0xFFFF006E).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: isPositive
                ? const Color(0xFF60EFFF).withOpacity(0.3)
                : const Color(0xFFFF8500).withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isPositive
                ? [
              const Color(0xFF00FF87),
              const Color(0xFF60EFFF),
              const Color(0xFF00FF87),
            ]
                : [
              const Color(0xFFFF006E),
              const Color(0xFFFF8500),
              const Color(0xFFFFD600),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(2.5),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0A0E27),
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isPositive
                      ? const Color(0xFF00FF87)
                      : const Color(0xFFFF006E),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      isPositive ? Icons.check : Icons.close,
                      color: isPositive
                          ? const Color(0xFF00FF87)
                          : const Color(0xFFFF006E),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}