import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_service.dart';

class BaseScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const BaseScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.centerTitle = true,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final themeService = GetIt.instance<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: centerTitle,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: bottom,
        actions: actions ??
            [
              IconButton(
                icon: Icon(
                  themeService.currentTheme == ThemeType.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: themeService.toggleTheme,
              ),
            ],
      ),
      body: body,
    );
  }
}
