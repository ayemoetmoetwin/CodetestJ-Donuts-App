import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/format/money.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/core/widgets/app_image.dart';
import 'package:jdonuts_app/core/widgets/shimmer_box.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';
part 'product_detail_about.dart';
part 'product_detail_card.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({
    required this.id,
    this.initial,
    this.fromSeasonal = false,
    super.key,
  });

  final String id;
  final CatalogProduct? initial;
  final bool fromSeasonal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seeded = initial;
    if (seeded != null) {
      return _Detail(product: seeded, fromSeasonal: fromSeasonal);
    }
    final product = ref.watch(productProvider(id));
    return product.when(
      loading: () => const _ProductSkeleton(),
      error: (_, _) =>
          _Missing(onRetry: () => ref.invalidate(productProvider(id))),
      data: (result) => result.when(
        success: (item) => _Detail(product: item, fromSeasonal: fromSeasonal),
        failure: (_) =>
            _Missing(onRetry: () => ref.invalidate(productProvider(id))),
      ),
    );
  }
}

class _ProductSkeleton extends StatelessWidget {
  const _ProductSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.canvas,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(height: 36, width: 36),
              SizedBox(height: AppSpacing.md),
              ShimmerBox(height: 320),
              SizedBox(height: AppSpacing.lg),
              ShimmerBox(height: 18, width: 120),
              SizedBox(height: AppSpacing.sm),
              ShimmerBox(height: 28, width: 220),
              SizedBox(height: AppSpacing.sm),
              ShimmerBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}

class _Detail extends ConsumerStatefulWidget {
  const _Detail({required this.product, required this.fromSeasonal});

  final CatalogProduct product;
  final bool fromSeasonal;

  @override
  ConsumerState<_Detail> createState() => _DetailState();
}

class _DetailState extends ConsumerState<_Detail> {
  var _quantity = 1;
  var _saving = false;

  Future<void> _add() async {
    if (_saving) {
      return;
    }
    setState(() => _saving = true);
    final result = await ref
        .read(cartRepositoryProvider)
        .add(widget.product.id, _quantity);
    if (!mounted) {
      return;
    }
    setState(() => _saving = false);
    final l10n = AppLocalizations.of(context);
    result.when(
      success: (_) {
        ref.invalidate(cartProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.addedToCart),
            duration: const Duration(seconds: 4),
            persist: false,
            action: SnackBarAction(
              label: l10n.viewCart,
              onPressed: () => context.push('/cart'),
            ),
          ),
        );
      },
      failure: (_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.loadError)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final product = widget.product;
    final percent = (product.discountPercent ?? 0).clamp(0, 100);
    final unit = product.priceMmk * (100 - percent) ~/ 100;
    final total = unit * _quantity;
    final showNew =
        product.discountPercent == null &&
        (product.isNew || widget.fromSeasonal);
    return Scaffold(
      backgroundColor: AppColors.canvas,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      AppSpacing.xs,
                      AppSpacing.lg,
                      AppSpacing.lg,
                    ),
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      _ProductCard(
                        product: product,
                        showNew: showNew,
                        newLabel: l10n.newBadge,
                        discountLabel: product.discountPercent == null
                            ? null
                            : l10n.percentOff(product.discountPercent!),
                        quantity: _quantity,
                        onQuantity: (value) =>
                            setState(() => _quantity = value),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      _About(title: l10n.whatsThis, body: product.description),
                    ],
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 140,
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.canvasClear,
                              AppColors.canvasWash,
                              AppColors.canvas,
                            ],
                            stops: [0, 0.45, 1],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xs,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              child: AppButton(
                label: l10n.addToCart,
                trailing: formatMmk(total),
                loading: _saving,
                onPressed: _add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
