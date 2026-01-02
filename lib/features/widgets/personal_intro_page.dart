import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../core/theme/theme_service.dart';

class PersonalIntroPage extends StatefulWidget {
  const PersonalIntroPage({super.key});

  @override
  State<PersonalIntroPage> createState() => _PersonalIntroPageState();
}

class _PersonalIntroPageState extends State<PersonalIntroPage> {
  late final ScrollController _scrollController;

  int _activeCardIndex = -1;

  final List<GlobalKey> _cardKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_onScroll);

    // 🔽 Distance-aware slow auto-scroll (Option 2)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 600), () {
        if (!_scrollController.hasClients) return;

        final maxScroll = _scrollController.position.maxScrollExtent;

        // ~110 px/sec → very calm, cinematic
        final durationMs =
        (maxScroll / 90 * 1000).clamp(7000, 16000).toInt();

        _scrollController.animateTo(
          maxScroll,
          duration: Duration(milliseconds: durationMs),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void _onScroll() {
    for (int i = 0; i < _cardKeys.length; i++) {
      final ctx = _cardKeys[i].currentContext;
      if (ctx == null) continue;

      final box = ctx.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero).dy;
      final height = box.size.height;
      final screenHeight = MediaQuery.of(context).size.height;

      if (position < screenHeight * 0.65 &&
          position + height > screenHeight * 0.35) {
        if (_activeCardIndex != i) {
          setState(() => _activeCardIndex = i);
        }
        return;
      }
    }

    if (_activeCardIndex != -1) {
      setState(() => _activeCardIndex = -1);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GetIt.instance<ThemeService>();

    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          _buildHeader(theme),
          const SizedBox(height: 48),

          _buildImageSection(
            key: _cardKeys[0],
            index: 0,
            title: 'What I Create',
            subtitle: "when I'm not shipping features",
            imagePath: 'assets/art.jpeg',
            color: theme.colors.neonPrimary,
          ),

          const SizedBox(height: 32),

          _buildImageSection(
            key: _cardKeys[1],
            index: 1,
            title: 'My Constant Companion',
            subtitle: 'during late-night debugging sessions',
            imagePath: 'assets/kittu.jpeg',
            color: theme.colors.neonAccent,
          ),

          const SizedBox(height: 32),

          _buildImageSection(
            key: _cardKeys[2],
            index: 2,
            title: 'Places That Called',
            subtitle: 'moments of wandering and wonder',
            imagePath: 'assets/places.png',
            color: theme.colors.neonSecondary,
          ),

          const SizedBox(height: 48),
          _buildClosing(),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeService theme) {
    return Column(
      children: [
        Text(
          'Behind the Code',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w300,
            color: theme.colors.neonAccent.withOpacity(0.9),
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'was a life being lived.',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w200,
            color: Colors.white.withOpacity(0.7),
            letterSpacing: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildImageSection({
    required Key key,
    required int index,
    required String title,
    required String subtitle,
    required String imagePath,
    required Color color,
  }) {
    final isActive = _activeCardIndex == index;

    return AnimatedContainer(
      key: key,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(isActive ? 0.08 : 0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? color : color.withOpacity(0.25),
          width: isActive ? 2.5 : 1.5,
        ),
        boxShadow: isActive
            ? [
          BoxShadow(
            color: color.withOpacity(0.35),
            blurRadius: 28,
            spreadRadius: 2,
          )
        ]
            : [],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: isActive ? color : color.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              height: 600,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClosing() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        'This was my year —\nboth in code and beyond it.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.white.withOpacity(0.8),
          height: 1.8,
        ),
      ),
    );
  }
}
