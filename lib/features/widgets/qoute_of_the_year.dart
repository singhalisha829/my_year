import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/theme/theme_extension.dart';
import '../../core/theme/theme_service.dart';

class QuotesFromTheYearScreen extends StatefulWidget {
  const QuotesFromTheYearScreen({super.key});

  @override
  State<QuotesFromTheYearScreen> createState() =>
      _QuotesFromTheYearScreenState();
}

class _QuotesFromTheYearScreenState extends State<QuotesFromTheYearScreen>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  final List<QuoteData> quotes = [
    QuoteData(
      quote: "Why does this work only on Android?",
      context: "After spending 3 hours debugging",
      emotion: "😤",
      category: "Platform Mysteries",
    ),
    QuoteData(
      quote: "Let me just change one small thing…",
      context: "Famous last words before breaking everything",
      emotion: "🤡",
      category: "Overconfidence",
    ),
    QuoteData(
      quote: "I'll refactor later",
      context: "(never)",
      emotion: "🙈",
      category: "Technical Debt",
    ),
    QuoteData(
      quote: "It works on my machine",
      context: "Narrator: It didn't work anywhere else",
      emotion: "🤷",
      category: "Classic Excuse",
    ),
    QuoteData(
      quote: "This should be easy",
      context: "3 days later...",
      emotion: "💀",
      category: "Famous Last Words",
    ),
    QuoteData(
      quote: "I'll just copy this from StackOverflow",
      context: "Understanding: 0%, Confidence: 100%",
      emotion: "🎭",
      category: "Developer Life",
    ),
    QuoteData(
      quote: "Who wrote this garbage code?",
      context: "*checks git blame* Oh... it was me",
      emotion: "😳",
      category: "Self Reflection",
    ),
    QuoteData(
      quote: "The bug is definitely not in my code",
      context: "Spoiler: It was",
      emotion: "🤦",
      category: "Denial",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      quotes.length,
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
                'Quotes From The Year',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Funny internal thoughts',
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    return SlideTransition(
                      position: _slideAnimations[index],
                      child: FadeTransition(
                        opacity: _fadeAnimations[index],
                        child: _buildQuoteCard(quotes[index], index),
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

  Widget _buildQuoteCard(QuoteData quote, int index) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final themeService = GetIt.instance<ThemeService>();

    return Container(
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
          if(themeService.currentTheme.name == 'dark')
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
          Row(
            children: [
              Text(
                quote.emotion,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: colors.neonPrimary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: colors.neonPrimary.withOpacity(0.5),
                    ),
                  ),
                  child: Text(
                    quote.category,
                    style:  TextStyle(
                      color: colors.neonPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '"${quote.quote}"',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.neonPrimary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: colors.neonPrimary.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                 Text(
                  '→ ',
                  style: TextStyle(
                    color: colors.neonPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    quote.context,
                    style: TextStyle(
                      color: colors.textMuted,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuoteData {
  final String quote;
  final String context;
  final String emotion;
  final String category;

  QuoteData({
    required this.quote,
    required this.context,
    required this.emotion,
    required this.category,
  });
}