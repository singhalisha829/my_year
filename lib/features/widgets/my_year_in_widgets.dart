import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_service.dart';

class WidgetCardsPage extends StatelessWidget {
  const WidgetCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Year in Widgets',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.3,
                children: [
                  WidgetCard(
                    title: 'StatelessWidget',
                    subtitle: 'Quick Wins',
                    caption: 'Low state. High impact.',
                    borderColor: themeService.colors.neonPrimary,
                    emoji: '⚡',
                    content: const [
                      '✅ Custom AppTheme (light / dark / pink) with full ColorScheme',
                      '✅ Role-based UI (Admin vs Client) — hide buttons, view-only modes',
                      '✅ Localization keys & multi-language translations',
                      '✅ Clean UI refactors using reusable widgets',
                      '✅ Simple screens wired cleanly with BlocProvider',
                      '✅ Firebase setup & basic FCM wiring',
                    ],
                  ),
                  WidgetCard(
                    title: 'StatefulWidget',
                    subtitle: 'Evolving Features',
                    caption: 'This started small…',
                    borderColor: const Color(0xFFfacc15),
                    emoji: '🔄',
                    content: const [
                      '🔄 Appointment confirmation & rescheduling flows',
                      '🔄 Drawing widgets with zoom, pan, snapping & confirmations',
                      '🔄 Product management screens (filter, search, pagination, modals)',
                      '🔄 Notification-driven navigation flows',
                      '🔄 Theme & text-scale persistence using SharedPreferences',
                      '🔄 Video call preview screens with lifecycle handling',
                    ],
                  ),
                  WidgetCard(
                    title: 'Bloc',
                    subtitle: 'Bugs That Tested Patience 😄',
                    caption: 'Eventually fixed.',
                    borderColor: themeService.colors.neonSecondary,
                    emoji: '🐞',
                    content: const [
                      '🐞 FCM handling across foreground / background / terminated states',
                      '🐞 Navigation triggered from notification payloads',
                      '🐞 Multi-Bloc coordination across complex flows',
                      '🐞 Race conditions with async initialization',
                      '🐞 State desync after app resume',
                      '🐞 "Why is this event firing twice?"',
                    ],
                  ),
                  WidgetCard(
                    title: 'FutureBuilder',
                    subtitle: 'Eventually Worked™',
                    caption: 'Solved it. Don\'t ask how.',
                    borderColor: themeService.colors.neonAccent,
                    emoji: '⏳',
                    content: const [
                      '⏳ Windows printing pipelines (blank pages, temp files, drivers)',
                      '⏳ PDF byte debugging & OS-level print dialogs',
                      '⏳ iOS TestFlight automation via GitHub Actions',
                      '⏳ Certificates, provisioning profiles, API keys',
                      '⏳ Video call ringtones without audio players',
                      '⏳ Edge / native command execution',
                    ],
                  ),
                  WidgetCard(
                    title: 'Clean\nArchitecture',
                    subtitle: 'Long-Term Sanity',
                    caption: 'Future me will thank me.',
                    borderColor: const Color(0xFF34d399),
                    emoji: '🧱',
                    content: const [
                      '🧱 Entity / Model / UseCase standardization',
                      '🧱 Repository & datasource separation',
                      '🧱 Mason bricks for Flutter initialization',
                      '🧱 Postman → architecture code generation',
                      '🧱 AI-assisted scaffolding workflows',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String caption;
  final Color borderColor;
  final String emoji;
  final List<String> content;

  const WidgetCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.caption,
    required this.borderColor,
    required this.emoji,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CardDetailDialog(
            title: title,
            subtitle: subtitle,
            caption: caption,
            borderColor: borderColor,
            content: content,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeService.colors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: borderColor.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const Spacer(),
              // Text(
              //   emoji,
              //   style: const TextStyle(fontSize: 20),
              // ),
              const SizedBox(height: 8),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.9),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDetailDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String caption;
  final Color borderColor;
  final List<String> content;

  const CardDetailDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.caption,
    required this.borderColor,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: themeService.colors.background.withAlpha(200),
          border: Border.all(color: borderColor, width: 4),
            boxShadow: [
              BoxShadow(
              color: borderColor.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
            ),],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '"$caption"',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  children: content
                      .map(
                        (item) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}