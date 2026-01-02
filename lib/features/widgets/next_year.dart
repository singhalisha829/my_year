import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_service.dart';

class NextYearFocusPage extends StatelessWidget {
  const NextYearFocusPage({super.key});

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
              'Next Year Focus',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2,
                children: [
                  WidgetCard(
                    title: '🧬 Going Deeper Into Native (Android & iOS)',
                    subtitle: 'Understand what Flutter abstracts — and when it leaks.',
                    caption: 'From “Flutter doesn’t support this”\n→ “I know where to implement this natively.”',
                    borderColor: themeService.colors.neonPrimary,
                    emoji: '⚡',
                    whatThisMeans: const [
                      'Android: Activities, Services, Intents, lifecycle nuances',
                      'iOS: ViewControllers, App lifecycle, background modes',
                      'Platform channels beyond “just make it work”'
                    ],
                    learnings: [
                      'Writing custom native plugins confidently',
                      'Debugging platform issues without guesswork',
                      'Designing Flutter features with native constraints in mind'
                    ],
                  ),
                  WidgetCard(
                    title: '🚢 App Deployment as a First-Class Skill',
                    subtitle: 'Own the entire lifecycle — not just development.',
                    caption: 'Shipping is part of the feature.',
                    borderColor: themeService.colors.neonYellow,
                    emoji: '🔄',
                    whatThisMeans: const [
                      'Android: signing, flavors, Play Console nuances',
                      'iOS: certificates, provisioning, App Store Connect',
                      'Versioning, build numbers, release strategies'
                    ],
                    learnings: [
                      'Zero-panic release days',
                      'Faster approvals and rollbacks',
                      'Confidence shipping across environments'
                    ],
                  ),
                  WidgetCard(
                    title: '🧠 Thinking in Systems, Not Screens',
                    subtitle: 'Move from feature-level thinking to system-level thinking.',
                    caption: 'Code doesn’t live in isolation — it lives in systems.',
                    borderColor: themeService.colors.neonSecondary,
                    emoji: '🐞',
                    whatThisMeans: const [
                      'Considering deployment, monitoring, and rollback during design',
                      'Designing features with failure in mind',
                      'Understanding how code behaves in the wild'
                    ],
                    learnings: [
                      'Fewer surprises post-release',
                      'Better long-term maintainability',
                      'Trust from teammates and stakeholders'
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
  final List<String> whatThisMeans;
  final List<String> learnings;

  const WidgetCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.caption,
    required this.borderColor,
    required this.emoji,
    required this.whatThisMeans,
    required this.learnings
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
            caption: subtitle,
            borderColor: borderColor,
            whatThisMeans: whatThisMeans,
            learnings: learnings,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeService.colors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            if(themeService.currentTheme.name =='dark')
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeService.colors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: themeService.colors.textSecondary,
                ),
              ),
              const Spacer(),
              const SizedBox(height: 8),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 13,
                  color: themeService.colors.textMuted,
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
  final String caption;
  final Color borderColor;
  final List<String> whatThisMeans;
  final List<String> learnings;

  const CardDetailDialog({
    super.key,
    required this.title,
    required this.caption,
    required this.borderColor,
    required this.whatThisMeans,
    required this.learnings
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
            if(themeService.currentTheme.name =='dark')
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: themeService.colors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '"$caption"',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: themeService.colors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: themeService.colors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What this means:',
                            style: TextStyle(
                                fontSize: 20,
                                color: themeService.colors.textPrimary,
                                fontWeight: FontWeight.w500
                            ),),
                          ...whatThisMeans
                              .map(
                                (item) =>Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.circle,size: 5,),
                                const SizedBox(width: 2,),
                                Flexible(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: themeService.colors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              .toList()],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Success looks like:',
                            style: TextStyle(
                                fontSize: 20,
                                color: themeService.colors.textPrimary,
                                fontWeight: FontWeight.w500
                            ),),
                          ...learnings
                              .map(
                                (item) =>Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.circle,size: 5,),
                                const SizedBox(width: 2,),
                                Flexible(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: themeService.colors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              .toList()],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}