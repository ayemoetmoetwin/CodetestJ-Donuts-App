import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_image.dart';
import 'package:jdonuts_app/core/widgets/shimmer_box.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/features/home/domain/entities/home_snapshot.dart';
import 'package:jdonuts_app/features/rewards/domain/member_tier.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';
import 'package:jdonuts_app/features/product/domain/entities/catalog_product.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

part 'widgets/home_header.dart';
part 'widgets/home_banners.dart';
part 'widgets/home_products.dart';
part 'widgets/home_shops.dart';
part 'widgets/home_skeleton.dart';
part 'widgets/home_skeleton_shops.dart';
part 'widgets/home_skeleton_sections.dart';
part 'widgets/home_banner_logo.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider);
    return home.when(
      loading: () => const HomeSkeleton(),
      error: (_, _) => _LoadError(onRetry: () => ref.invalidate(homeProvider)),
      data: (result) => result.when(
        success: (snapshot) => _HomeContent(snapshot: snapshot),
        failure: (_) => _LoadError(onRetry: () => ref.invalidate(homeProvider)),
      ),
    );
  }
}

class _HomeContent extends ConsumerStatefulWidget {
  const _HomeContent({required this.snapshot});

  final HomeSnapshot snapshot;

  @override
  ConsumerState<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<_HomeContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: Motion.entrance,
  );
  var _started = false;

  @override
  void initState() {
    super.initState();
    if (underTest) {
      _enter.value = 1;
      _started = true;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) {
      return;
    }
    _started = true;
    if (motionAllowed(context)) {
      _enter.forward();
    } else {
      _enter.value = 1;
    }
  }

  @override
  void dispose() {
    _enter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final snapshot = widget.snapshot;
    final shopCount = snapshot.shops.when(
      success: (shops) => shops.length,
      failure: (_) => 0,
    );
    final blocks = <Widget>[
      _TopBand(
        member: snapshot.member,
        banners: snapshot.banners,
        onRetry: () => ref.invalidate(homeProvider),
      ),
      for (final section in snapshot.sections) _SectionBlock(section: section),
      _Shops(
        title: l10n.shopsNear(shopCount),
        shops: snapshot.shops,
        exploreLabel: l10n.exploreNow,
        orderLabel: l10n.orderOnline,
        onRetry: () => ref.invalidate(homeProvider),
      ),
    ];
    return ColoredBox(
      color: AppColors.canvas,
      child: RefreshIndicator(
        color: AppColors.pink,
        onRefresh: () async {
          ref.invalidate(homeProvider);
          await ref.read(homeProvider.future);
        },
        child: CustomScrollView(
          paintOrder: SliverPaintOrder.lastIsTop,
          slivers: [
            _BannerUnderlay(
              child: _Enter(animation: _enter, index: 0, child: blocks.first),
            ),
            SliverToBoxAdapter(
              child: ColoredBox(
                color: AppColors.canvas,
                child: Column(
                  children: [
                    for (var index = 1; index < blocks.length; index++)
                      _Enter(
                        animation: _enter,
                        index: index,
                        child: blocks[index],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Keeps the banner on screen a little longer so the sections slide over it.
class _BannerUnderlay extends SingleChildRenderObjectWidget {
  const _BannerUnderlay({required Widget child}) : super(child: child);

  @override
  RenderSliverSingleBoxAdapter createRenderObject(BuildContext context) {
    return _RenderBannerUnderlay();
  }
}

class _RenderBannerUnderlay extends RenderSliverSingleBoxAdapter {
  @override
  void performLayout() {
    final child = this.child;
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    child.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final height = switch (constraints.axis) {
      Axis.horizontal => child.size.width,
      Axis.vertical => child.size.height,
    };
    final scrolled = constraints.scrollOffset;
    final remaining = constraints.remainingPaintExtent;
    if (scrolled >= height || remaining <= 0) {
      geometry = SliverGeometry(scrollExtent: height);
      return;
    }
    final layout = (height - scrolled).clamp(0.0, remaining);
    final paintExtent = height < remaining ? height : remaining;
    geometry = SliverGeometry(
      scrollExtent: height,
      paintExtent: paintExtent,
      layoutExtent: layout,
      maxPaintExtent: height > paintExtent ? height : paintExtent,
      hitTestExtent: layout,
      cacheExtent: paintExtent,
      hasVisualOverflow: paintExtent > layout,
    );
    (child.parentData! as SliverPhysicalParentData).paintOffset = Offset.zero;
  }
}

class _Enter extends StatelessWidget {
  const _Enter({
    required this.animation,
    required this.index,
    required this.child,
  });

  final Animation<double> animation;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final start = (index * 0.12).clamp(0.0, 0.72);
        final t = Interval(
          start,
          1,
          curve: Motion.standard,
        ).transform(animation.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 28 * (1 - t)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
