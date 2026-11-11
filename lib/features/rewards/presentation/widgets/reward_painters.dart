import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:jdonuts_app/core/format/money.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';

part 'tier_track.dart';
part 'tier_ladder.dart';

class PointsRing extends StatelessWidget {
  const PointsRing({
    required this.from,
    required this.points,
    required this.caption,
    required this.animate,
    super.key,
  });

  static const maxPoints = 680000;

  final int from;
  final int points;
  final String caption;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final end = points.clamp(0, maxPoints).toDouble();
    if (!animate) {
      return _RingFace(shown: end, caption: caption);
    }
    final start = from.clamp(0, maxPoints).toDouble();
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: start, end: end),
      duration: motionOf(context, Motion.countUp),
      curve: Motion.emphasized,
      builder: (context, shown, _) {
        return _RingFace(shown: shown, caption: caption);
      },
    );
  }
}

class _RingFace extends StatelessWidget {
  const _RingFace({required this.shown, required this.caption});

  final double shown;
  final String caption;

  @override
  Widget build(BuildContext context) {
    // CustomPainter ring. The arc is the shown total divided by 680,000.
    final progress = (shown / PointsRing.maxPoints).clamp(0.0, 1.0);
    return SizedBox.expand(
      child: CustomPaint(
        painter: _DonutRingPainter(progress),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  caption,
                  style: AppTypography.micro.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.ringInk,
                  ),
                ),
                Text(
                  formatPoints(shown.round()),
                  style: AppTypography.rewardTitle.copyWith(
                    height: 1.05,
                    color: AppColors.ringInk,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DonutRingPainter extends CustomPainter {
  const _DonutRingPainter(this.progress);

  final double progress;

  static const _start = 280 * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final stroke = size.width * 0.16;
    final radius = size.width / 2 - stroke / 2 - 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweep = math.pi * 2 * progress;
    final dough = Paint()
      ..color = AppColors.ringDough
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    final frosting = Paint()
      ..color = AppColors.ringFrosting
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, dough);
    if (progress >= 1) {
      canvas.drawCircle(center, radius, frosting);
    } else if (sweep > 0) {
      canvas.drawArc(rect, _start, sweep, false, frosting);
    }
    _sprinkles(canvas, center, radius, stroke, sweep);
  }

  void _sprinkles(
    Canvas canvas,
    Offset center,
    double radius,
    double stroke,
    double sweep,
  ) {
    if (sweep <= 0) {
      return;
    }
    final paint = Paint()..color = AppColors.surface;
    const count = 14;
    for (var index = 0; index < count; index++) {
      final t = (index + 0.45) / count;
      if (t > progress) {
        continue;
      }
      final angle = _start + sweep * t;
      final tilt = index.isEven ? 0.35 : -0.2;
      final pos = Offset(
        center.dx + math.cos(angle) * radius,
        center.dy + math.sin(angle) * radius,
      );
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(angle + math.pi / 2 + tilt);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset.zero,
            width: stroke * 0.22,
            height: stroke * 0.62,
          ),
          Radius.circular(stroke * 0.12),
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_DonutRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class QuarterClipper extends CustomClipper<Path> {
  const QuarterClipper(this.quarters);

  final int quarters;

  @override
  Path getClip(Size size) {
    if (quarters >= 4) {
      return Path()..addRect(Offset.zero & size);
    }
    if (quarters <= 0) {
      return Path();
    }
    return Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..arcTo(Offset.zero & size, -math.pi / 4, math.pi / 2 * quarters, false)
      ..close();
  }

  @override
  bool shouldReclip(QuarterClipper oldClipper) =>
      oldClipper.quarters != quarters;
}

class CoffeeArcPainter extends CustomPainter {
  const CoffeeArcPainter(this.fraction);

  final double fraction;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(4, 2, size.width - 8, size.height - 8);
    const start = 198 * math.pi / 180;
    const sweep = 142 * math.pi / 180;
    final track = Paint()
      ..color = AppColors.coffeeTrack
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    final arc = Paint()
      ..color = AppColors.coffeeArc
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, start, sweep, false, track);
    if (fraction > 0) {
      canvas.drawArc(rect, start, sweep * fraction.clamp(0, 1), false, arc);
    }
  }

  @override
  bool shouldRepaint(CoffeeArcPainter oldDelegate) =>
      oldDelegate.fraction != fraction;
}
