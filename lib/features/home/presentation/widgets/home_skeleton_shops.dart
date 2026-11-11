part of '../home_screen.dart';

class _ShopSkeleton extends StatelessWidget {
  const _ShopSkeleton({required this.pulse});

  final Animation<double> pulse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: _sectionTop),
        Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                _backdropAsset,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.block,
                    AppSpacing.lg,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        pulse: pulse,
                        height: 22,
                        width: 220,
                        radius: AppSpacing.xs,
                        color: AppColors.surface,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ShimmerBox(
                        pulse: pulse,
                        height: 28,
                        width: 112,
                        radius: AppSpacing.pill,
                        color: AppColors.surface,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSpacing.shopList,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      AppSpacing.md,
                      AppSpacing.lg,
                      AppSpacing.md,
                    ),
                    itemCount: 2,
                    separatorBuilder: (_, _) =>
                        const SizedBox(width: AppSpacing.sm),
                    itemBuilder: (_, _) => _ShopBone(pulse: pulse),
                  ),
                ),
                const SizedBox(height: _bottomGap),
              ],
            ),
          ],
        ),
        const ColoredBox(
          color: AppColors.pink,
          child: SizedBox(
            height: _pinkBand + AppSpacing.navHeight,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}

class _ShopBone extends StatelessWidget {
  const _ShopBone({required this.pulse});

  final Animation<double> pulse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacing.shopCard,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.bannerRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(
                pulse: pulse,
                height: AppSpacing.shopImage,
                width: AppSpacing.shopCard - (AppSpacing.sm * 2),
                radius: AppSpacing.sm,
              ),
              const SizedBox(height: AppSpacing.xs),
              ShimmerBox(
                pulse: pulse,
                height: 14,
                width: 140,
                radius: AppSpacing.xs,
              ),
              const SizedBox(height: AppSpacing.xxs),
              ShimmerBox(
                pulse: pulse,
                height: 12,
                width: 180,
                radius: AppSpacing.xs,
              ),
              const SizedBox(height: AppSpacing.xs),
              ShimmerBox(
                pulse: pulse,
                height: 14,
                width: 96,
                radius: AppSpacing.xs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadError extends StatelessWidget {
  const _LoadError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.loadError),
          TextButton(onPressed: onRetry, child: Text(l10n.retry)),
        ],
      ),
    );
  }
}
