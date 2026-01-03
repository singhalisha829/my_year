import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:year_of_alisha/features/widgets/base_scaffold.dart';

import '../../core/theme/theme_extension.dart';
import '../../core/theme/theme_service.dart';
import '../widgets/built_vs_broke_me.dart';
import '../widgets/error_driven_timeline.dart';
import '../widgets/next_year.dart';
import '../widgets/packages_that_carried_me.dart';
import '../widgets/qoute_of_the_year.dart';
import '../widgets/what_i_would_do_different.dart';
import '../widgets/where_my_time_went.dart';

// Personal section imports (create these screens)
import '../widgets/personal_intro_page.dart';
import '../widgets/year_as_flutter_release.dart';

enum WrapSection { professional, personal }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WrapSection _currentSection = WrapSection.professional;

  // Separate controllers for each section
  late PageController _professionalController;
  late PageController _personalController;

  int _professionalPage = 0;
  int _personalPage = 0;

  final List<Widget> _professionalPages = [
    const ErrorDrivenTimelineCardsPage(),
    const TimeSpentWhereScreen(),
    const BuiltVsBrokeMeScreen(),
    const PackagesThatCarriedMeScreen(),
    const QuotesFromTheYearScreen(),
    const YearReleaseScreen(),
    const LearningsPage(),
    const NextYearFocusPage(),
    // const WidgetCardsPage(),
  ];

  final List<Widget> _personalPages = [
    const PersonalIntroPage(),
  ];

  @override
  void initState() {
    super.initState();
    _professionalController = PageController();
    _personalController = PageController();
  }

  @override
  void dispose() {
    _professionalController.dispose();
    _personalController.dispose();
    super.dispose();
  }

  List<Widget> get _currentPages =>
      _currentSection == WrapSection.professional
          ? _professionalPages
          : _personalPages;

  PageController get _currentController =>
      _currentSection == WrapSection.professional
          ? _professionalController
          : _personalController;

  int get _currentPage =>
      _currentSection == WrapSection.professional
          ? _professionalPage
          : _personalPage;

  void _onSectionChanged(WrapSection? section) {
    if (section == null) return;
    setState(() {
      _currentSection = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).extension<CustomColors>()!;
    final themeService = GetIt.instance<ThemeService>();

    return BaseScaffold(
      title: 'Year Of Alisha',
      body: Column(
        children: [
          // Section Selector
           _buildSectionSelector(),
          const SizedBox(height: 10,),

          // Content Area with AnimatedSwitcher
          Container(
            height: screenHeight * 0.77,
            color: themeService.currentTheme.name == 'dark'?Colors.transparent:colors.textMuted.withOpacity(0.1),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: _currentSection == WrapSection.professional
                  ? Curves.easeOutCubic
                  : Curves.easeInOutQuad,
              switchOutCurve: _currentSection == WrapSection.professional
                  ? Curves.easeInCubic
                  : Curves.easeInOutQuad,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.03),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: PageView(
                key: ValueKey(_currentSection),
                controller: _currentController,
                onPageChanged: (index) {
                  setState(() {
                    if (_currentSection == WrapSection.professional) {
                      _professionalPage = index;
                    } else {
                      _personalPage = index;
                    }
                  });
                },
                children: _currentPages,
              ),
            ),
          ),

          const Spacer(),

          // Page Indicators
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _currentPages.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 32 : 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? colors.textPrimary
                        : colors.textMuted,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionSelector() {
    final colors = Theme.of(context).extension<CustomColors>()!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.textMuted.withAlpha(30),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            children: [
              Expanded(
                child: _buildSectionButton(
                  label: 'Work',
                  icon: Icons.code,
                  section: WrapSection.professional,
                  isSelected: _currentSection == WrapSection.professional,
                ),
              ),
              Expanded(
                child: _buildSectionButton(
                  label: 'Life',
                  icon: Icons.favorite,
                  section: WrapSection.personal,
                  isSelected: _currentSection == WrapSection.personal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionButton({
    required String label,
    required IconData icon,
    required WrapSection section,
    required bool isSelected,
  }) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    return GestureDetector(
      onTap: () => _onSectionChanged(section),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? colors.neonAccent.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? colors.neonAccent
                  : colors.textMuted,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? colors.neonAccent
                    : colors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}