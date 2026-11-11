import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/features/auth/domain/auth_policy.dart';

class OtpBoxes extends StatelessWidget {
  const OtpBoxes({
    required this.controller,
    required this.onChanged,
    required this.locked,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final value = controller.text;
    return SizedBox(
      height: 58,
      child: Stack(
        children: [
          Row(
            children: [
              for (var index = 0; index < OtpPolicy.length; index++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xxs,
                    ),
                    child: _Box(
                      digit: index < value.length ? value[index] : '',
                    ),
                  ),
                ),
            ],
          ),
          TextField(
            key: const Key('otp-field'),
            controller: controller,
            autofocus: true,
            enabled: !locked,
            keyboardType: TextInputType.number,
            autofillHints: const [AutofillHints.oneTimeCode],
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(OtpPolicy.length),
            ],
            style: AppTypography.hiddenInput,
            cursorColor: AppColors.transparent,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({required this.digit});

  final String digit;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: motionOf(context, Motion.fast),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        border: Border.all(
          color: digit.isEmpty ? AppColors.line : AppColors.cyan,
        ),
      ),
      child: Text(
        digit,
        style: AppTypography.bannerTitle.copyWith(color: AppColors.text),
      ),
    );
  }
}

const _ringExtent = 40.0;
const _ringStrokeRatio = 0.28;
const _checkStrokeRatio = 0.22;

class ProgressRing extends StatelessWidget {
  const ProgressRing({
    required this.progress,
    this.showCheck = false,
    super.key,
  });

  final double progress;
  final bool showCheck;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: showCheck ? 1 : progress),
      duration: motionOf(context, Motion.ring),
      curve: Motion.emphasized,
      builder: (context, value, _) {
        return SizedBox(
          width: _ringExtent,
          height: _ringExtent,
          child: CustomPaint(
            painter: _RingPainter(progress: value, showCheck: showCheck),
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.progress, required this.showCheck});

  final double progress;
  final bool showCheck;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final stroke = size.shortestSide * _ringStrokeRatio;
    final radius = (size.shortestSide - stroke) / 2;
    final track = Paint()
      ..color = AppColors.ringRest
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final arc = Paint()
      ..color = AppColors.pink
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    canvas.drawCircle(center, radius, track);
    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -1.5708,
        6.2832 * progress,
        false,
        arc,
      );
    }
    if (!showCheck) {
      return;
    }
    final check = Paint()
      ..color = AppColors.pink
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = stroke * _checkStrokeRatio;
    final path = Path()
      ..moveTo(center.dx - 6, center.dy)
      ..lineTo(center.dx - 1, center.dy + 5)
      ..lineTo(center.dx + 7, center.dy - 5);
    canvas.drawPath(path, check);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.showCheck != showCheck;
  }
}
