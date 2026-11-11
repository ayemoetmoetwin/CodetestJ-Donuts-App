part of '../home_screen.dart';

class _Shops extends StatelessWidget {
  const _Shops({
    required this.title,
    required this.shops,
    required this.exploreLabel,
    required this.orderLabel,
    required this.onRetry,
  });

  final String title;
  final Result<List<Shop>> shops;
  final String exploreLabel;
  final String orderLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(1);
    final cardWidth = MediaQuery.sizeOf(context).width * _cardWidthFactor;
    final photoHeight = (cardWidth - 24) / _photoAspect;
    final listHeight = (photoHeight + _textBlock) * scale;
    return Column(
      children: [
        const SizedBox(height: _sectionTop),
        Stack(
          children: [
            const Positioned.fill(child: _ShopBackdrop()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.lg,
                    AppSpacing.lg,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title 😊',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.shopTitle,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSpacing.pill),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.md,
                            vertical: AppSpacing.xs,
                          ),
                          child: Text(
                            exploreLabel,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.cyanDeep,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                SizedBox(
                  height: listHeight,
                  child: shops.when(
                    success: (items) {
                      if (items.isEmpty) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(context).emptySection,
                            style: AppTypography.body.copyWith(
                              color: AppColors.surface,
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                        ),
                        itemCount: items.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(width: AppSpacing.sm),
                        itemBuilder: (context, index) => _ShopCard(
                          shop: items[index],
                          orderLabel: orderLabel,
                          width: cardWidth,
                        ),
                      );
                    },
                    failure: (_) => Center(
                      child: TextButton(
                        onPressed: onRetry,
                        child: Text(
                          AppLocalizations.of(context).sectionError,
                          style: AppTypography.body.copyWith(
                            color: AppColors.surface,
                          ),
                        ),
                      ),
                    ),
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

class _ShopBackdrop extends StatelessWidget {
  const _ShopBackdrop();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _backdropAsset,
      fit: BoxFit.cover,
      alignment: Alignment.bottomCenter,
    );
  }
}

class _ShopCard extends StatelessWidget {
  const _ShopCard({
    required this.shop,
    required this.orderLabel,
    required this.width,
  });

  final Shop shop;
  final String orderLabel;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(_cardRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.scrim.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(_photoRadius),
                  child: AspectRatio(
                    aspectRatio: _photoAspect,
                    child: Image.asset(_coverAsset, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  shop.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.cardTitle.copyWith(height: 1.15),
                ),
                const SizedBox(height: 4),
                Text(
                  shop.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.caption.copyWith(height: 1.3),
                ),
                const SizedBox(height: 8),
                Text(
                  orderLabel,
                  style: AppTypography.label.copyWith(
                    color: AppColors.pink,
                    height: 1.1,
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

const _backdropAsset = 'assets/images/shops_landscape.png';
const _coverAsset = 'assets/images/shop_case.jpg';
const _cardWidthFactor = 0.78;
const _cardRadius = 22.0;
const _photoRadius = 14.0;
const _photoAspect = 298 / 162;
const _textBlock = 126.0;
const _sectionTop = 30.0;
const _bottomGap = 30.0;
const _pinkBand = 30.0;
