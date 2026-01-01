import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_service.dart';
import '../widgets/built_vs_broke_me.dart';
import '../widgets/error_driven_timeline.dart';
import '../widgets/my_year_in_widgets.dart';
import '../widgets/packages_that_carried_me.dart';
import '../widgets/qoute_of_the_year.dart';
import '../widgets/where_my_time_went.dart';

class YearInWidgetsCarousel extends StatefulWidget {
  const YearInWidgetsCarousel({super.key});

  @override
  State<YearInWidgetsCarousel> createState() => _YearInWidgetsCarouselState();
}

class _YearInWidgetsCarouselState extends State<YearInWidgetsCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const QuotesFromTheYearScreen(),
    const PackagesThatCarriedMeScreen(),
    const TimeSpentWhereScreen(),
    const BuiltVsBrokeMeScreen(),
    const ErrorDrivenTimelineCardsPage(),
    const WidgetCardsPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: themeService.colors.background,
      appBar: AppBar(
        backgroundColor: themeService.colors.background,
        elevation: 0,
        title: const Text(
          'Year of Alisha',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeService.currentTheme.name == 'dark' ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeService.toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.8,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: _pages,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 32 : 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
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
}
