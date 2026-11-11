part of '../home_screen.dart';

class _SectionSkeleton extends StatelessWidget {
  const _SectionSkeleton({
    required this.pulse,
    required this.cardWidth,
    required this.imageHeight,
    required this.surfaceCard,
  });

  final Animation<double> pulse;
  final double cardWidth;
  final double imageHeight;
  final bool surfaceCard;

  @override
  Widget build(BuildContext context) {
    final listHeight = imageHeight + 38 + AppSpacing.xs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.block,
            30,
            AppSpacing.block,
            AppSpacing.sm,
          ),
          child: Row(
            children: [
              ShimmerBox(
                pulse: pulse,
                height: 22,
                width: 168,
                radius: AppSpacing.xs,
              ),
              const Spacer(),
              ShimmerBox(
                pulse: pulse,
                height: 32,
                width: 32,
                circle: true,
                color: AppColors.surface,
              ),
            ],
          ),
        ),
        SizedBox(
          height: listHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 3,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (_, _) => _ProductBone(
              pulse: pulse,
              width: cardWidth,
              imageHeight: imageHeight,
              surfaceCard: surfaceCard,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductBone extends StatelessWidget {
  const _ProductBone({
    required this.pulse,
    required this.width,
    required this.imageHeight,
    required this.surfaceCard,
  });

  final Animation<double> pulse;
  final double width;
  final double imageHeight;
  final bool surfaceCard;

  @override
  Widget build(BuildContext context) {
    final image = ShimmerBox(
      pulse: pulse,
      height: surfaceCard
          ? imageHeight - AppSpacing.cardPad - AppSpacing.md
          : imageHeight,
      width: surfaceCard ? width - (AppSpacing.row * 2) : width,
      radius: surfaceCard ? AppSpacing.sm : AppSpacing.radius,
    );
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (surfaceCard)
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.cardPad),
              ),
              child: SizedBox(
                height: imageHeight,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.row,
                    AppSpacing.cardPad,
                    AppSpacing.row,
                    AppSpacing.md,
                  ),
                  child: image,
                ),
              ),
            )
          else
            image,
          const SizedBox(height: AppSpacing.xs),
          ShimmerBox(
            pulse: pulse,
            height: 14,
            width: width * 0.72,
            radius: AppSpacing.xs,
          ),
          const SizedBox(height: AppSpacing.xxs),
          ShimmerBox(
            pulse: pulse,
            height: 14,
            width: width * 0.46,
            radius: AppSpacing.xs,
          ),
        ],
      ),
    );
  }
}
