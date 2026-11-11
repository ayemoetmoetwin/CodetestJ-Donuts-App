import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: Motion.entrance,
  );
  late final CurvedAnimation _art = CurvedAnimation(
    parent: _enter,
    curve: const Interval(0, 0.62, curve: Motion.standard),
  );
  late final CurvedAnimation _title = CurvedAnimation(
    parent: _enter,
    curve: const Interval(0.42, 0.82, curve: Motion.standard),
  );
  late final CurvedAnimation _button = CurvedAnimation(
    parent: _enter,
    curve: const Interval(0.62, 1, curve: Motion.standard),
  );
  late final Animation<Offset> _artSlide = Tween<Offset>(
    begin: const Offset(0, 0.08),
    end: Offset.zero,
  ).animate(_art);
  late final Animation<Offset> _titleSlide = Tween<Offset>(
    begin: const Offset(0, 0.2),
    end: Offset.zero,
  ).animate(_title);

  @override
  void initState() {
    super.initState();
    if (underTest) {
      _enter.value = 1;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_enter.isAnimating || _enter.isCompleted) {
      return;
    }
    if (motionAllowed(context)) {
      _enter.forward();
    } else {
      _enter.value = 1;
    }
  }

  @override
  void dispose() {
    _art.dispose();
    _title.dispose();
    _button.dispose();
    _enter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.welcome,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final artHeight = constraints.maxHeight * 0.7;
          return Stack(
            children: [
              const Positioned.fill(
                child: ColoredBox(color: AppColors.welcome),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: artHeight,
                child: FadeTransition(
                  opacity: _art,
                  child: SlideTransition(
                    position: _artSlide,
                    child: const _WelcomeArt(),
                  ),
                ),
              ),
              Positioned(
                left: AppSpacing.screenPadding,
                right: AppSpacing.screenPadding,
                bottom: 0,
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                    child: Column(
                      children: [
                        FadeTransition(
                          opacity: _title,
                          child: SlideTransition(
                            position: _titleSlide,
                            child: Text(
                              l10n.welcomeTitle,
                              textAlign: TextAlign.center,
                              style: AppTypography.rewardTitle.copyWith(
                                color: AppColors.text,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        FadeTransition(
                          opacity: _button,
                          child: AppButton(
                            key: const Key('explore-button'),
                            label: l10n.letsExplore,
                            onPressed: () {
                              ref.read(showWelcomeProvider.notifier).state =
                                  false;
                              context.go('/home');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _WelcomeArt extends StatelessWidget {
  const _WelcomeArt();

  @override
  Widget build(BuildContext context) {
    final fade = AppColors.welcome;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/welcome_pattern.png',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                fade.withValues(alpha: 0),
                fade.withValues(alpha: 0),
                fade,
              ],
              stops: const [0.78, 0.9, 1],
            ),
          ),
        ),
      ],
    );
  }
}
