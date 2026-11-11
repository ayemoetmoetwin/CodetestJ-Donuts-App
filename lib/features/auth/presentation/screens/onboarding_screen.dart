import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/domain/usecases/start_phone_auth.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_controller.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.welcome,
      body: Column(
        children: [
          const Expanded(child: _Pattern()),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenPadding,
                AppSpacing.sm,
                AppSpacing.screenPadding,
                AppSpacing.md,
              ),
              child: Column(
                children: [
                  _Rise(
                    child: Text(
                      l10n.onboardingTitle,
                      textAlign: TextAlign.center,
                      style: AppTypography.display.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _Rise(
                    delay: 0.16,
                    child: AppButton(
                      label: l10n.letsGetStarted,
                      onPressed: () {
                        ref
                            .read(authControllerProvider.notifier)
                            .begin(AuthMode.register);
                        context.push('/auth/phone');
                      },
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _Rise(
                    delay: 0.32,
                    child: Column(
                      children: [
                        TextButton(
                          key: const Key('login-button'),
                          onPressed: () {
                            ref
                                .read(authControllerProvider.notifier)
                                .begin(AuthMode.login);
                            context.push('/auth/phone');
                          },
                          child: Text.rich(
                            TextSpan(
                              text: l10n.alreadyHaveAccount,
                              style: AppTypography.body.copyWith(
                                color: AppColors.text,
                              ),
                              children: [
                                TextSpan(
                                  text: l10n.logIn,
                                  style: AppTypography.body.copyWith(
                                    color: AppColors.pink,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const _SocialRow(),
                        const SizedBox(height: AppSpacing.md),
                        LegalLine(l10n: l10n),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Rise extends StatefulWidget {
  const _Rise({required this.child, this.delay = 0});

  final Widget child;
  final double delay;

  @override
  State<_Rise> createState() => _RiseState();
}

class _RiseState extends State<_Rise> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.entrance,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!motionAllowed(context)) {
      _controller.value = 1;
      return;
    }
    if (_controller.isDismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final start = widget.delay.clamp(0.0, 0.7);
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(start, 1, curve: Motion.standard),
    );
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.18),
          end: Offset.zero,
        ).animate(animation),
        child: widget.child,
      ),
    );
  }
}

class _Pattern extends StatelessWidget {
  const _Pattern();

  @override
  Widget build(BuildContext context) {
    final fade = AppColors.welcome;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/onboarding_pattern.png',
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
              stops: const [0, 0.58, 1],
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          onPressed: () => showComingSoon(context),
          child: const _GoogleMark(),
        ),
        const SizedBox(width: AppSpacing.xl),
        _SocialButton(
          onPressed: () => showComingSoon(context),
          child: const Icon(Icons.apple, color: AppColors.ink, size: 28),
        ),
        const SizedBox(width: AppSpacing.xl),
        _SocialButton(
          onPressed: () => showComingSoon(context),
          child: const Icon(
            Icons.facebook,
            color: AppColors.facebook,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.child, required this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: child);
  }
}

class _GoogleMark extends StatelessWidget {
  const _GoogleMark();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GooglePainter()),
    );
  }
}

class _GooglePainter extends CustomPainter {
  const _GooglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.22;
    final rect = Rect.fromLTWH(
      stroke / 2,
      stroke / 2,
      size.width - stroke,
      size.height - stroke,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.butt;
    canvas.drawArc(
      rect,
      -0.4,
      1.35,
      false,
      paint..color = AppColors.googleBlue,
    );
    canvas.drawArc(rect, 1.0, 1.2, false, paint..color = AppColors.googleGreen);
    canvas.drawArc(
      rect,
      2.3,
      1.15,
      false,
      paint..color = AppColors.googleYellow,
    );
    canvas.drawArc(rect, 3.5, 1.3, false, paint..color = AppColors.googleRed);
    final bar = Paint()
      ..color = AppColors.googleBlue
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.butt;
    final mid = size.height / 2;
    canvas.drawLine(
      Offset(size.width * 0.52, mid),
      Offset(size.width - stroke / 2, mid),
      bar,
    );
  }

  @override
  bool shouldRepaint(_GooglePainter oldDelegate) => false;
}
