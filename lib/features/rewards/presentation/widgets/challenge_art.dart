part of '../rewards_screen.dart';

class _Art extends StatelessWidget {
  const _Art({required this.challenge, required this.reveal});

  final Challenge challenge;
  final bool reveal;

  @override
  Widget build(BuildContext context) {
    // Donut quarters and the coffee arc are painted from the saved progress.
    if (challenge.art == 'coffee') {
      final fraction = reveal ? challenge.progress / challenge.goal : 0.0;
      return _CoffeeArt(fraction: fraction);
    }
    if (challenge.art == 'donut') {
      return _DonutArt(filled: reveal ? challenge.progress : 0);
    }
    final asset = challenge.id == 'g_box'
        ? 'assets/images/product_santa_cutout.png'
        : 'assets/images/product_coconut_cutout.png';
    return _StillArt(asset: asset);
  }
}

class _DonutArt extends StatelessWidget {
  const _DonutArt({required this.filled});

  final int filled;

  static const _asset = 'assets/images/reward_donut.png';
  static const _gray = ColorFilter.matrix(<double>[
    0.33,
    0.33,
    0.33,
    0,
    48,
    0.33,
    0.33,
    0.33,
    0,
    48,
    0.33,
    0.33,
    0.33,
    0,
    48,
    0,
    0,
    0,
    1,
    0,
  ]);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: filled.toDouble()),
      duration: motionOf(context, Motion.ring),
      curve: Motion.standard,
      builder: (context, value, _) {
        final quarters = value.floor();
        return SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColorFiltered(colorFilter: _gray, child: _image()),
              ClipPath(
                clipper: QuarterClipper(quarters.clamp(0, 4)),
                child: _image(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _image() {
    return Image.asset(_asset, fit: BoxFit.contain);
  }
}

class _CoffeeArt extends StatelessWidget {
  const _CoffeeArt({required this.fraction});

  final double fraction;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: fraction),
      duration: motionOf(context, Motion.ring),
      curve: Motion.standard,
      builder: (context, value, _) {
        return SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(96, 96),
                painter: CoffeeArcPainter(value),
              ),
              Image.asset(
                'assets/images/reward_coffee.png',
                width: 42,
                height: 72,
                fit: BoxFit.contain,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StillArt extends StatelessWidget {
  const _StillArt({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Image.asset(asset, fit: BoxFit.contain),
    );
  }
}
