import 'package:flutter/material.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';

class ShimmerBox extends StatefulWidget {
  const ShimmerBox({
    required this.height,
    this.width,
    this.radius = AppSpacing.radius,
    this.borderRadius,
    this.circle = false,
    this.color = AppColors.line,
    this.pulse,
    super.key,
  });

  final double height;
  final double? width;
  final double radius;
  final BorderRadius? borderRadius;
  final bool circle;
  final Color color;
  final Animation<double>? pulse;

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  AnimationController? _owned;

  @override
  void initState() {
    super.initState();
    if (widget.pulse != null) {
      return;
    }
    final owned = AnimationController(vsync: this, duration: Motion.slow);
    if (underTest) {
      owned.value = 1;
    } else {
      owned.repeat(reverse: true);
    }
    _owned = owned;
  }

  @override
  void dispose() {
    _owned?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pulse = widget.pulse ?? _owned!;
    return AnimatedBuilder(
      animation: pulse,
      builder: (context, child) {
        return Opacity(opacity: 0.35 + (0.5 * pulse.value), child: child);
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          shape: widget.circle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: widget.circle
              ? null
              : widget.borderRadius ?? BorderRadius.circular(widget.radius),
        ),
      ),
    );
  }
}
