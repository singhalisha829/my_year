import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_extension.dart';
import '../../core/theme/theme_service.dart';

class PackagesThatCarriedMeScreen extends StatefulWidget {
  const PackagesThatCarriedMeScreen({super.key});

  @override
  State<PackagesThatCarriedMeScreen> createState() =>
      _PackagesThatCarriedMeScreenState();
}

class _PackagesThatCarriedMeScreenState
    extends State<PackagesThatCarriedMeScreen> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  final List<PackageData> packages = [
    PackageData(
        name: 'flutter_bloc',
        description: '⭐⭐⭐⭐⭐ (Therapist)',
        caption: 'At least state made sense.',
        content: [
          'Held complex flows together',
          'Made chaos debuggable',
          'Gave structure when everything else was on fire'
        ],
        awards: [
          '🧠 Backbone of the Year',
          '🏋️ Most Responsibility Taken'
        ]
    ),
    PackageData(
        name: 'get_it',
        description: '⭐⭐⭐⭐ (Organizer Friend)',
        caption: 'Just register it once. Breathe.',
        content: [
          'Saved you from constructor hell',
          'Reduced mental overload',
          'Made large apps navigable'
        ],
        awards: [
          '🧩 Sanity Saver',
          '🧹 Least Talked About, Most Needed'
        ]
    ),
    PackageData(
        name: 'firebase_messaging',
        description: '⭐⭐⭐⭐½ (Crisis Manager)',
        caption: 'Something broke, but I know where.',
        content: [
          'Managed notification chaos',
          'Bridged background, foreground, and terminated states',
          "Took the blame for things that weren't always its fault"
        ],
        awards: [
          '🔔 Most Blamed Package',
          '🔥 Survived All App States'
        ]
    ),
    PackageData(
        name: 'InteractiveViewer',
        description: '⭐⭐⭐½ (Reliable Workhorse)',
        caption: "I zoom. I pan. I don't complain.",
    content: [
    'Powered my custom drawing system',
        'Enabled desktop + mobile interactions',
        'Quietly supported complex gestures'
        ],
        awards: [
          '🔍 Did More Than It Advertised',
          '🧱 Foundation of Interactions'
        ]
    ),
    PackageData(
        name: 'shared_preferences',
        description: '⭐⭐⭐ (Quiet Supporter)',
        caption: 'At least something remembered me.',
        content: [
          'Theme persistence',
          'Text scale memory',
          'Small but user-facing wins'
        ],
        awards: [
          '🧠 Short-Term Memory Hero'
        ]
    ),
    PackageData(
        name: 'fpdart',
        description: '⭐⭐⭐⭐½ (Life Coach)',
        caption: 'Handle the failure. On purpose.',
        content: [
          'Clear success vs failure flows',
          'Safer async handling',
          'Cleaner domain logic',
          'Fewer "this should never be null" lies'
        ],
        awards: [
          '🧠 Most Mature Package',
          '🛡️ Emotional Stability Award'
        ]
    ),
    PackageData(
        name: 'intl',
        description: '⭐⭐⭐½ (Culture Translator)',
        caption: 'Dates, numbers, and languages are hard. I help.',
        content: [
          'Prevented hardcoded strings',
          'Avoided format-related UI breaks',
          'Made localization feel intentional, not bolted on'
        ],
        awards: [
          '🌐 Made the App World-Ready',
          '📅 Date Formatting Therapist'
        ]
    ),
    PackageData(
        name: 'equatable',
        description: '⭐⭐⭐⭐ (Conflict Resolver)',
        caption: 'No, these two states are not different.',
        content: [
          'Prevented unnecessary rebuilds',
          'Made state equality explicit',
          'Reduced "why did this rebuild?" debugging',
          'Kept Bloc predictable under pressure'
        ],
        awards: [
          '⚖️ Most Quietly Essential',
          '🔁 Rebuild Prevention Unit'
        ]
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      packages.length,
          (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    _fadeAnimations = _controllers
        .map((controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    ))
        .toList();

    _slideAnimations = _controllers
        .map((controller) => Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
    ))
        .toList();

    _startAnimations();
  }

  void _startAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(Duration(milliseconds: 150 * i));
      if (mounted) {
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _showPackageDetails(
      PackageData package,
      Color backgroundColor,
      Color textColor,
      Color iconColor,
      bool isDarkMode)
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backgroundColor,
                  backgroundColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: textColor,
              ),
              boxShadow: [
                if(isDarkMode)
                BoxShadow(
                  color: textColor.withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          package.name,
                          style:  TextStyle(
                            color: textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                      IconButton(
                        icon:  Icon(Icons.close, color: iconColor),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    package.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: textColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: textColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      '"${package.caption}"',
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                   Text(
                    'What it did:',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...package.content.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          '• ',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(height: 20),
                  Text(
                    'Awards:',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...package.awards.map((award) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          textColor.withOpacity(0.2),
                          textColor.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: textColor.withOpacity(0.5),
                      ),
                    ),
                    child: Text(
                      award,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Packages That Carried Me',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: packages.length,
                  itemBuilder: (context, index) {
                    return SlideTransition(
                      position: _slideAnimations[index],
                      child: FadeTransition(
                        opacity: _fadeAnimations[index],
                        child: _buildPackageCard(packages[index], index,context),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildPackageCard(PackageData package, int index, BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final themeService = GetIt.instance<ThemeService>();

    return GestureDetector(
      onTap: () => _showPackageDetails(package,colors.background,colors.neonPrimary,colors.textMuted,themeService.currentTheme.name == 'dark'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.neonPrimary.withOpacity(0.15),
              colors.neonPrimary.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: colors.neonPrimary,
          ),
          boxShadow: [
            if(themeService.currentTheme.name =='dark')
            BoxShadow(
              color: colors.neonPrimary.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package.name,
              style:  TextStyle(
                color: colors.neonPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              package.description,
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 14,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageData {
  final String name;
  final String description;
  final String caption;
  final List<String> awards;
  final List<String> content;

  PackageData({
    required this.name,
    required this.description,
    required this.caption,
    required this.awards,
    required this.content,
  });
}