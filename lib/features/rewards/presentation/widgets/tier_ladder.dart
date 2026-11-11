part of 'reward_painters.dart';

class _TierCaption extends StatelessWidget {
  const _TierCaption({required this.caption});

  final String caption;

  @override
  Widget build(BuildContext context) {
    if (caption.isEmpty) {
      return const SizedBox.shrink();
    }
    final lines = caption.split('\n');
    final style = AppTypography.micro.copyWith(
      fontWeight: FontWeight.w500,
      height: 1.25,
    );
    if (lines.length < 3) {
      return Text(caption, softWrap: true, style: style);
    }
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topLeft,
      child: Text(
        caption,
        maxLines: lines.length,
        softWrap: false,
        style: style,
      ),
    );
  }
}

class _TierLine extends StatelessWidget {
  const _TierLine({required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final amount = fill.clamp(0, 1).toDouble();
    return SizedBox(
      width: 44,
      height: 72,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 4,
          height: 72,
          child: Stack(
            children: [
              const Positioned.fill(
                child: ColoredBox(color: AppColors.tierLine),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: amount,
                  widthFactor: 1,
                  child: const ColoredBox(color: AppColors.tierLineFill),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TierShield extends StatelessWidget {
  const _TierShield({
    required this.badge,
    required this.active,
    required this.reached,
  });

  final _TierBadge badge;
  final bool active;
  final bool reached;

  static const _width = 44.0;
  static const _height = 50.0;

  @override
  Widget build(BuildContext context) {
    final width = active ? _width + 2 : _width;
    final height = active ? _height + 2 : _height;
    Widget image = Image.asset(
      badge.asset,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
    if (!reached) {
      image = Opacity(opacity: 0.38, child: image);
    }
    return SizedBox(
      width: _width + 4,
      height: _height + 4,
      child: Center(
        child: reached
            ? Stack(
                alignment: Alignment.center,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      badge.stroke,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      badge.asset,
                      width: width + 2,
                      height: height + 2,
                      fit: BoxFit.contain,
                    ),
                  ),
                  image,
                ],
              )
            : image,
      ),
    );
  }
}
