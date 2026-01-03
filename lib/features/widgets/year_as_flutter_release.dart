import 'package:flutter/material.dart';

import '../../core/theme/theme_extension.dart';

class YearReleaseScreen extends StatefulWidget {
  const YearReleaseScreen({super.key});

  @override
  State<YearReleaseScreen> createState() => _YearReleaseScreenState();
}

class _YearReleaseScreenState extends State<YearReleaseScreen> {
  late ScrollController _scrollController;
  int focusedIndex = 0; // Default to first item or whatever you prefer


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Optional: Schedule a check after build to set initial focus correctly
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
  }

  void _onScroll() {
    // Determine the "Center" area of the scroll view
    // We use an estimated item extent including padding to calculate index
    final itemExtent = 180.0; // Estimate height of card + padding
    final scrollOffset = _scrollController.hasClients ? _scrollController.offset : 0.0;

    // Calculate the center of the viewport relative to the list content
    final viewportCenter = scrollOffset + (MediaQuery.of(context).size.height / 2);

    // Adjust logic to find which item's center is closest to the viewport center
    // We add some padding/offset compensation
    final listTopPadding = MediaQuery.of(context).size.height * 0.35;

    int newFocusedIndex = ((viewportCenter - listTopPadding) / itemExtent).floor();

    // Clamp to ensure we don't go out of bounds
    newFocusedIndex = newFocusedIndex.clamp(0, 5);

    if (newFocusedIndex != focusedIndex) {
      setState(() {
        focusedIndex = newFocusedIndex;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;

    final List<ReleaseData> releases = [
      ReleaseData(
        version: '1.0.0',
        title: 'Naive Optimism',
        description: 'Everything will work on the first try, right?',
        gradient: [
          colors.releaseBlueStart,
          colors.releaseBlueEnd,
        ],
      ),

      ReleaseData(
        version: '1.2.0',
        title: 'Bug Fixes & Hot Reload Abuse',
        description: 'Ctrl+S is my best friend. Also my worst enemy.',
        gradient: [
          colors.releasePinkStart,
          colors.releasePinkEnd,
        ],
      ),

      ReleaseData(
        version: '2.0.0',
        title: 'Clean Architecture Enlightenment',
        description: 'I finally understand why folders matter.',
        gradient: [
          colors.releaseCyanStart,
          colors.releaseCyanEnd,
        ],
      ),

      ReleaseData(
        version: '2.5.0',
        title: 'State Management Wars',
        description: 'Provider? Bloc? Riverpod? Yes.',
        gradient: [
          colors.releaseGreenStart,
          colors.releaseGreenEnd,
        ],
      ),

      ReleaseData(
        version: '3.0.0',
        title: 'Confident Cross-Platform Dev',
        description: 'iOS, Android, Web... I fear nothing now.',
        gradient: [
          colors.releaseYellowStart,
          colors.releaseYellowEnd,
        ],
      ),

      ReleaseData(
        version: '3.0.1',
        title: 'Production Hotfix',
        description: 'Turns out I still fear production bugs.',
        gradient: [
          colors.releaseIndigoStart,
          colors.releaseIndigoEnd,
        ],
      ),
    ];

    return SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'If My Year Was a Flutter Release',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.35,
                  horizontal: 24,
                ),
                itemCount: releases.length,
                itemBuilder: (context, index) {
                  return _buildReleaseCard(releases[index], index);
                },
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildReleaseCard(ReleaseData release, int index) {
    final colors = Theme.of(context).extension<CustomColors>()!;

    final isFocused = focusedIndex == index;
    // Scale: 1.05 (slightly larger than normal) if focused, 0.85 if not
    final scale = isFocused ? 1.05 : 0.85;

    return GestureDetector(
      onTap: () {
        // Scroll to make this item focused
        final itemExtent = 180.0;
        final listTopPadding = MediaQuery.of(context).size.height * 0.35;

        // Calculate offset to center the item
        final targetScroll = (index * itemExtent) -
            (MediaQuery.of(context).size.height / 2) +
            listTopPadding + (itemExtent / 2);

        _scrollController.animateTo(
          targetScroll.clamp(
            _scrollController.position.minScrollExtent,
            _scrollController.position.maxScrollExtent,
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack, // Gives a nice little bounce effect
        margin: const EdgeInsets.only(bottom: 20),
        transform: Matrix4.identity()..scale(scale),
        transformAlignment: Alignment.center, // Ensures it scales from the center
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              release.gradient[0].withOpacity(0.2),
              release.gradient[1].withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: release.gradient[0].withOpacity(isFocused ? 0.8 : 0.3),
            width: isFocused ? 3.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: release.gradient[0].withOpacity(isFocused ? 0.4 : 0.1),
              blurRadius: isFocused ? 30 : 10,
              spreadRadius: isFocused ? 2 : 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: release.gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: release.gradient[0].withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    release.version,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              release.title,
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox(width: double.infinity), // Placeholder to keep width
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  release.description,
                  style: TextStyle(
                    color: colors.textMuted,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              crossFadeState: isFocused
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

class ReleaseData {
  final String version;
  final String title;
  final String description;
  final List<Color> gradient;

  ReleaseData({
    required this.version,
    required this.title,
    required this.description,
    required this.gradient,
  });
}