part of 'product_detail_screen.dart';

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.showNew,
    required this.newLabel,
    required this.discountLabel,
    required this.quantity,
    required this.onQuantity,
  });

  final CatalogProduct product;
  final bool showNew;
  final String newLabel;
  final String? discountLabel;
  final int quantity;
  final ValueChanged<int> onQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.code,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Padding(
                  padding: EdgeInsets.only(
                    right: discountLabel != null
                        ? 96
                        : showNew
                        ? 72
                        : 0,
                  ),
                  child: Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.rewardTitle.copyWith(height: 1.1),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  formatMmk(product.priceMmk),
                  style: AppTypography.cardTitle,
                ),
                const SizedBox(height: AppSpacing.xl),
                Center(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.58,
                    height: MediaQuery.sizeOf(context).width * 0.58,
                    child: AppImage(
                      asset: product.imageAsset,
                      url: product.imageUrl,
                      heroTag: 'product-${product.id}',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
          if (showNew || discountLabel != null)
            Positioned(
              top: AppSpacing.md,
              right: AppSpacing.md,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (showNew) _DetailBadge(label: newLabel),
                  if (discountLabel != null)
                    _DetailBadge(label: discountLabel!),
                ],
              ),
            ),
          Positioned(
            bottom: -22,
            child: _Stepper(quantity: quantity, onChanged: onQuantity),
          ),
        ],
      ),
    );
  }
}

class _DetailBadge extends StatelessWidget {
  const _DetailBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.badgeOrange,
        borderRadius: BorderRadius.circular(AppSpacing.pill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.tight,
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.surface,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
      ),
    );
  }
}
