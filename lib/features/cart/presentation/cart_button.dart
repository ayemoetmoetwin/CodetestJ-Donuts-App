import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';

class CartButton extends ConsumerWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final count = cart.maybeWhen(
      data: (result) => result.when(
        success: (lines) =>
            lines.fold<int>(0, (sum, line) => sum + line.quantity),
        failure: (_) => 0,
      ),
      orElse: () => 0,
    );
    return IconButton(
      key: const Key('cart-button'),
      onPressed: () => context.push('/cart'),
      icon: Badge(
        isLabelVisible: count > 0,
        backgroundColor: AppColors.pink,
        label: Text('$count'),
        child: const Icon(Icons.shopping_bag_outlined, color: AppColors.ink),
      ),
    );
  }
}
