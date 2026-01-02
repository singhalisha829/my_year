import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_extension.dart';
import '../../core/theme/theme_service.dart';

class LearningsPage extends StatelessWidget {
  const LearningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What I’d Do Differently',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'This year wasn’t just about building apps.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [
                  WidgetCard(
                    title: '🧪 Write Tests Earlier',
                    caption: 'Tests don’t slow you down — they stop you from breaking momentum.',
                    borderColor: colors.neonPrimary,
                    content: const [
                      'Writing tests early would have:'
                      '>> Clarified edge cases before bugs appeared',
                      '>> Reduced fear during refactors',
                      '>> Acted as living documentation',
                    ],
                  ),
                  WidgetCard(
                    title: '🔁 Refactor in Small Increments',
                    caption: 'Refactoring isn’t an event. It’s a habit.',
                    borderColor: colors.neonYellow,
                    content: const [
                      'Smaller, continuous refactors would have:'
                      '>> Reduced merge conflicts',
                      '>> Prevented tech debt buildup',
                      '>> Kept code healthier over time'
                    ],
                  ),
                  WidgetCard(
                    title: '⏳ Estimate with Buffers',
                    caption: 'If I think it’ll take a day, it probably needs two.',
                    borderColor: colors.neonSecondary,
                    content: const [
                      'I consistently underestimated:'
                      '>> Edge cases'
                      '>> Platform-specific behavior',
                      '>> “Small” UI tweaks',
                    ],
                  ),
                  WidgetCard(
                    title: '🪵 Log Everything',
                    caption: 'Logs are your future self asking for help.',
                    borderColor: colors.neonAccent,
                    content: const [
                      'Better logging would have:',
                      '>> Explained silent failures',
                      '>> Reduced “can’t reproduce” moments',
                      '>> Made production debugging calmer'
                    ],
                  ),
                  WidgetCard(
                    title: '📚 Read the Docs Before the Panic',
                    caption: 'Docs aren’t optional. They’re a shortcut.',
                    borderColor: colors.neonPurple,
                    content: const [
                      'Earlier documentation reading would have:',
                      '>> Saved hours of trial and error',
                      '>> Prevented incorrect assumptions',
                      '>> Reduced frustration'
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Next year isn’t about doing more —\nit’s about doing things right earlier.",
                style: TextStyle(
                  fontSize: 15,
                  color: colors.textSecondary,
                ),
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
  final String caption;
  final Color borderColor;
  final List<String> content;

  const WidgetCard({
    super.key,
    required this.title,
    required this.caption,
    required this.borderColor,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final themeService = GetIt.instance<ThemeService>();

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CardDetailDialog(
            title: title,
            caption: caption,
            borderColor: borderColor,
            content: content,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            if(themeService.currentTheme.name == 'dark')
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
                  color: colors.textPrimary,
                ),
              ),

              const Spacer(),
              Text(
                caption,
                style: TextStyle(
                  fontSize: 11,
                  color: colors.textSecondary,
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
  final List<String> content;

  const CardDetailDialog({
    super.key,
    required this.title,
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
            if(themeService.currentTheme.name == 'dark')
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
                            fontSize: 28,
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
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: themeService.colors.textPrimary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: content
                        .map(
                          (item) => Text(
                          item,
                          style: TextStyle(
                            fontSize: 15,
                            color: themeService.colors.textPrimary,
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}