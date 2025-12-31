import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_service.dart';

class ErrorDrivenTimelineCardsPage extends StatelessWidget {
  const ErrorDrivenTimelineCardsPage({super.key});

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
              'Error-Driven Timeline',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'My year told through Flutter errors I survived',
              style: TextStyle(
                fontSize: 20,
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
                childAspectRatio: 1,
                children: [
                  WidgetCard(
                    title: '💀 Null check operator used on a null value',
                    caption: 'Character Development Arc',
                    subTitle: 'But the API always returns this… right?',
                    borderColor: themeService.colors.neonPrimary,
                    emoji: '⚡',
                    whatHappened: const [
                      'API responses lying',
                      'Optional fields that weren’t optional yesterday',
                      'Async race conditions',
                      '! used as a coping mechanism',
                      'Overconfidence in backend contracts',
                    ],
                    learnings: [
                      '! is not confidence — it’s denial',
                      'Defensive modeling saves lives',
                      'Nullable fields deserve respect',
                      'Logs > assumptions'
                    ],
                  ),
                  WidgetCard(
                    title: '📐 RenderFlex overflowed by XX pixels',
                    caption: 'UI Alignment Phase',
                    subTitle: 'It fits on my phone. Why does it hate this one?',
                    borderColor: const Color(0xFFfacc15),
                    emoji: '🔄',
                    whatHappened: const [
                      'Dynamic text + localization',
                      'Responsive layouts on small devices',
                      'Grid + Column + Expanded doing illegal things',
                      'Windows desktop scaling chaos',
                      'Cards that looked perfect… until they didn’t',
                    ],
                    learnings: [
                      'Flutter is honest but unforgiving',
                      'Flexible, Expanded, and Wrap are survival tools',
                      'Constraints matter more than widgets',
                      'Test with long text, large fonts, and real data'
                    ],
                  ),
                  WidgetCard(
                    title: '🥀 The Art of Letting Go',
                    caption: 'Learning to dispose everything properly',
                    subTitle: 'Just because it started with me doesn’t mean it should end with me.',
                    borderColor: const Color(0xFF34d399),
                    emoji: '🧱',
                    whatHappened: const [
                      'Async calls finishing after navigation',
                      'Streams, timers, and listeners refusing to die',
                      'Cubits emitting to widgets that had already moved on',
                      'Background callbacks touching UI logic',
                    ],
                    learnings: [
                      'Every listener you create is a responsibility',
                      'dispose() is not optional housekeeping',
                      'Cancel streams, timers, and subscriptions explicitly',
                      'UI lifecycles must be respected, not assumed',
                      'mounted checks save both crashes and sanity'
                    ],
                  ),
                  WidgetCard(
                    title: '🧭 Looking up a deactivated widget’s ancestor is unsafe',
                    caption: 'The Ghost Context Era',
                    subTitle: 'But I literally have a context. I can see it.',
                    borderColor: themeService.colors.neonAccent,
                    emoji: '⏳',
                    whatHappened: const [
                      'Using context.read() after await',
                      'Calling navigation after async operations',
                      'Dialogs closing before logic finished',
                      'StatefulWidgets living past their usefulness',
                    ],
                    learnings: [
                      'await changes everything',
                      'Context has a lifetime',
                      'UI and async logic must be carefully choreographed'
                    ],
                  ),
                  WidgetCard(
                    title: 'Fixed without knowing why',
                    caption: 'Legendary Moment',
                    subTitle: 'I don’t know why this works, but I will not question it.',
                    borderColor: themeService.colors.neonSecondary,
                    emoji: '🐞',
                    whatHappened: const [
                      'Native calls behaving differently per machine',
                      'Android app not building',
                    ],
                    learnings: [
                      'Sometimes the fix is time',
                      'Sometimes the fix is rebuild',
                      'Sometimes the fix is don’t touch it',
                      'Sometimes the fix is flutter upgrade'
                      'Engineering humility is a skill'
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
  final String subTitle;
  final String caption;
  final Color borderColor;
  final String emoji;
  final List<String> whatHappened;
  final List<String> learnings;

  const WidgetCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.caption,
    required this.borderColor,
    required this.emoji,
    required this.whatHappened,
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
            caption: subTitle,
            borderColor: borderColor,
            whatHappened: whatHappened,
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
              const Spacer(),
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
  final String caption;
  final Color borderColor;
  final List<String> whatHappened;
  final List<String> learnings;

  const CardDetailDialog({
    super.key,
    required this.title,
    required this.caption,
    required this.borderColor,
    required this.whatHappened,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                          'What was happening',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),),
                          ...whatHappened
                            .map(
                              (item) =>Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.circle,size: 5,),
                                  const SizedBox(width: 2,),
                                  Flexible(
                                    child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
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
                        'What I learned',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
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
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
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