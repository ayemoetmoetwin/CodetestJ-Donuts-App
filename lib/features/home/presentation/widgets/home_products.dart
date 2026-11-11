part of '../home_screen.dart';

class _SectionBlock extends ConsumerWidget {
  const _SectionBlock({required this.section});

  final HomeSection section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final seasonal = section.id == 'seasonal';
    final orderAgain = section.id == 'order_again';
    final screen = MediaQuery.sizeOf(context).width;
    final scale = MediaQuery.textScalerOf(context).scale(1);
    final cardWidth = seasonal ? screen * 0.62 : screen * 0.40;
    final visualHeight = seasonal
        ? cardWidth / 1.5
        : cardWidth * (orderAgain ? 1.2 : 1.52);
    final nameBlock = 38 * scale;
    final listHeight = visualHeight + nameBlock + AppSpacing.xs;
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
              Expanded(
                child: Text(
                  section.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bannerTitle.copyWith(
                    color: AppColors.ink,
                  ),
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: listHeight,
          child: section.products.when(
            success: (products) {
              if (products.isEmpty) {
                return Center(child: Text(l10n.emptySection));
              }
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: products.length,
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemBuilder: (context, index) => _ProductCard(
                  product: products[index],
                  sectionId: section.id,
                  width: cardWidth,
                ),
              );
            },
            failure: (_) => Center(
              child: TextButton(
                onPressed: () => ref.invalidate(homeProvider),
                child: Text(l10n.sectionError),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.sectionId,
    required this.width,
  });

  final CatalogProduct product;
  final String sectionId;
  final double width;

  @override
  Widget build(BuildContext context) {
    final seasonal = sectionId == 'seasonal';
    final orderAgain = sectionId == 'order_again';
    final badge = product.discountPercent == null
        ? null
        : _Badge(
            label: '${product.discountPercent}% off',
            color: AppColors.badgeOrange,
          );
    final image = AppImage(
      asset: product.imageAsset,
      url: product.imageUrl,
      heroTag: 'product-${product.id}',
      fit: seasonal ? BoxFit.cover : BoxFit.contain,
    );
    final scale = MediaQuery.textScalerOf(context).scale(1);
    final textWidth = 126 * scale;
    final name = SizedBox(
      width: textWidth < width ? textWidth : width,
      height: 38 * scale,
      child: Text(
        product.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.body.copyWith(
          color: AppColors.ink,
          height: 1.2,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: () => context.push(
          '/product/${product.id}?section=$sectionId',
          extra: product,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: seasonal
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.radius),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          image,
                          if (badge != null)
                            Positioned(
                              right: AppSpacing.xs,
                              bottom: AppSpacing.xs,
                              child: badge,
                            ),
                        ],
                      ),
                    )
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppSpacing.cardPad),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              AppSpacing.row,
                              AppSpacing.cardPad,
                              AppSpacing.row,
                              AppSpacing.md,
                            ),
                            child: image,
                          ),
                          if (badge != null)
                            orderAgain
                                ? Positioned(
                                    right: AppSpacing.xs,
                                    bottom: AppSpacing.xs,
                                    child: badge,
                                  )
                                : Align(
                                    alignment: const Alignment(0, 0.72),
                                    child: badge,
                                  ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: AppSpacing.xs),
            name,
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.inset,
        vertical: AppSpacing.xxs + 1,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSpacing.pill),
        border: Border.all(color: AppColors.surface, width: 1),
      ),
      child: Text(
        label,
        style: AppTypography.micro.copyWith(color: AppColors.surface),
      ),
    );
  }
}
