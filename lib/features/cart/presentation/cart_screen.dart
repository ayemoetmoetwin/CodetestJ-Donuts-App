import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/format/money.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/core/widgets/app_image.dart';
import 'package:jdonuts_app/features/cart/domain/entities/cart_line.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final cart = ref.watch(cartProvider);
    return Scaffold(
      backgroundColor: AppColors.page,
      appBar: AppBar(
        backgroundColor: AppColors.page,
        elevation: 0,
        title: Text(l10n.cartTitle, style: AppTypography.section),
      ),
      body: cart.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => _Message(text: l10n.loadError),
        data: (result) => result.when(
          success: (lines) => lines.isEmpty
              ? _Message(text: l10n.emptyCart)
              : _CartList(lines: lines),
          failure: (_) => _Message(text: l10n.loadError),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: AppTypography.body));
  }
}

class _CartList extends ConsumerWidget {
  const _CartList({required this.lines});

  final List<CartLine> lines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final total = lines.fold<int>(0, (sum, line) => sum + line.lineTotal);
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: lines.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) => _LineTile(line: lines[index]),
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.xs,
              AppSpacing.lg,
              AppSpacing.md,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        l10n.cartTotal,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.section,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        formatMmk(total),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: AppTypography.section,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                const _CheckoutBar(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LineTile extends ConsumerWidget {
  const _LineTile({required this.line});

  final CartLine line;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final product = line.product;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius),
      ),
      child: Row(
        children: [
          SizedBox(
            width: AppSpacing.thumb,
            height: AppSpacing.thumb,
            child: AppImage(asset: product.imageAsset, url: product.imageUrl),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.cardTitle,
                ),
                Text(formatMmk(line.lineTotal), style: AppTypography.body),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _Qty(
                      icon: Icons.remove,
                      onPressed: () => _set(ref, line.quantity - 1),
                    ),
                    SizedBox(
                      width: AppSpacing.pill,
                      child: Text(
                        '${line.quantity}',
                        textAlign: TextAlign.center,
                        style: AppTypography.cardTitle,
                      ),
                    ),
                    _Qty(
                      icon: Icons.add,
                      onPressed: () => _set(ref, line.quantity + 1),
                    ),
                    TextButton(
                      onPressed: () => _set(ref, 0),
                      child: Text(
                        l10n.removeItem,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _set(WidgetRef ref, int quantity) async {
    await ref
        .read(cartRepositoryProvider)
        .setQuantity(line.product.id, quantity);
    ref.invalidate(cartProvider);
  }
}

class _CheckoutBar extends ConsumerStatefulWidget {
  const _CheckoutBar();

  @override
  ConsumerState<_CheckoutBar> createState() => _CheckoutBarState();
}

class _CheckoutBarState extends ConsumerState<_CheckoutBar> {
  var _placing = false;

  Future<void> _place() async {
    if (_placing) {
      return;
    }
    setState(() => _placing = true);
    final result = await ref.read(cartRepositoryProvider).checkout();
    if (!mounted) {
      return;
    }
    setState(() => _placing = false);
    final placed = result.when(success: (_) => true, failure: (_) => false);
    if (!placed) {
      return;
    }
    ref.invalidate(cartProvider);
    ref.invalidate(rewardsProvider);
    ref.invalidate(homeProvider);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).orderPlaced)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppButton(
      label: l10n.placeOrder,
      loading: _placing,
      onPressed: _placing ? null : _place,
    );
  }
}

class _Qty extends StatelessWidget {
  const _Qty({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: AppSpacing.row),
      visualDensity: VisualDensity.compact,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.page,
        foregroundColor: AppColors.ink,
      ),
    );
  }
}
