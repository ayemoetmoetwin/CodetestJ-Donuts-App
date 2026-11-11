part of '../home_screen.dart';

class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: Motion.slow,
  );

  @override
  void initState() {
    super.initState();
    if (underTest) {
      _pulse.value = 1;
    } else {
      _pulse.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final seasonal = width * 0.62;
    final compact = width * 0.40;
    return ColoredBox(
      color: AppColors.canvas,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _BandSkeleton(pulse: _pulse),
          _SectionSkeleton(
            pulse: _pulse,
            cardWidth: seasonal,
            imageHeight: seasonal / 1.5,
            surfaceCard: false,
          ),
          _SectionSkeleton(
            pulse: _pulse,
            cardWidth: compact,
            imageHeight: compact * 1.52,
            surfaceCard: true,
          ),
          _SectionSkeleton(
            pulse: _pulse,
            cardWidth: compact,
            imageHeight: compact * 1.2,
            surfaceCard: true,
          ),
          _ShopSkeleton(pulse: _pulse),
        ],
      ),
    );
  }
}

class _BandSkeleton extends StatelessWidget {
  const _BandSkeleton({required this.pulse});

  final Animation<double> pulse;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final width = MediaQuery.sizeOf(context).width;
    final bannerWidth = width * 0.78;
    final bannerRadius = const BorderRadius.vertical(
      top: Radius.circular(AppSpacing.bannerRadius),
    );
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSpacing.bandOuterLeft),
          bottomRight: Radius.circular(AppSpacing.bandOuterRight),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.stroke),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppSpacing.bandInnerLeft),
            bottomRight: Radius.circular(AppSpacing.bandInnerRight),
          ),
          child: ColoredBox(
            color: AppColors.cream,
            child: Column(
              children: [
                SizedBox(height: top),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.xs,
                    AppSpacing.lg,
                    AppSpacing.tight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ShimmerBox(
                            pulse: pulse,
                            height: 58,
                            width: 58,
                            circle: true,
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerBox(
                                pulse: pulse,
                                height: 18,
                                width: 132,
                                radius: AppSpacing.xs,
                              ),
                              const SizedBox(height: AppSpacing.hairline),
                              ShimmerBox(
                                pulse: pulse,
                                height: 12,
                                width: 84,
                                radius: AppSpacing.xs,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      ShimmerBox(
                        pulse: pulse,
                        height: 32,
                        width: 196,
                        radius: AppSpacing.pill,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSpacing.bannerHeight,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: AppSpacing.lg),
                    children: [
                      ShimmerBox(
                        pulse: pulse,
                        height: AppSpacing.bannerHeight,
                        width: bannerWidth,
                        borderRadius: bannerRadius,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      ShimmerBox(
                        pulse: pulse,
                        height: AppSpacing.bannerHeight,
                        width: bannerWidth,
                        borderRadius: bannerRadius,
                      ),
                    ],
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
