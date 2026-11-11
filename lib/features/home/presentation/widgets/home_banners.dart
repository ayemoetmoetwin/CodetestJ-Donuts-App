part of '../home_screen.dart';

class _Banners extends StatefulWidget {
  const _Banners({required this.banners});

  final List<PromoBanner> banners;

  @override
  State<_Banners> createState() => _BannersState();
}

class _BannersState extends State<_Banners> {
  late final PageController _controller = PageController(
    viewportFraction: 0.86,
  );
  Timer? _timer;
  var _page = 0;

  @override
  void initState() {
    super.initState();
    _schedule();
  }

  void _schedule() {
    if (underTest) {
      return;
    }
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 4), () {
      if (!mounted || widget.banners.length < 2) {
        return;
      }
      _page = (_page + 1) % widget.banners.length;
      _controller.animateToPage(
        _page,
        duration: Motion.medium,
        curve: Motion.standard,
      );
      _schedule();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const _BannerNotice(empty: true);
    }
    return SizedBox(
      height: AppSpacing.bannerHeight,
      child: PageView.builder(
        controller: _controller,
        padEnds: false,
        itemCount: widget.banners.length,
        itemBuilder: (context, index) {
          final banner = widget.banners[index];
          final first = index == 0;
          return Padding(
            padding: EdgeInsets.only(
              left: first ? AppSpacing.lg : AppSpacing.xs,
              right: AppSpacing.xs,
            ),
            child: _PromoCard(banner: banner, first: first),
          );
        },
      ),
    );
  }
}

class _BannerNotice extends StatelessWidget {
  const _BannerNotice({required this.empty, this.onRetry});

  final bool empty;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: AppSpacing.bannerHeight,
      child: Center(
        child: empty
            ? Text(l10n.emptySection, style: AppTypography.body)
            : TextButton(onPressed: onRetry, child: Text(l10n.sectionError)),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.banner, required this.first});

  final PromoBanner banner;
  final bool first;

  @override
  Widget build(BuildContext context) {
    final background = first ? AppColors.bannerPurple : AppColors.bannerSky;
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(AppSpacing.bannerRadius),
      ),
      child: ColoredBox(
        color: background,
        child: Stack(
          children: [
            const Positioned.fill(
              child: ColoredBox(color: AppColors.bannerWash),
            ),
            const Positioned.fill(
              child: CustomPaint(painter: _SprinklePainter()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: first ? Alignment.center : Alignment.centerLeft,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.badgeOrange,
                        borderRadius: BorderRadius.circular(AppSpacing.pill),
                        border: Border.all(color: AppColors.surface, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xxs,
                        ),
                        child: Text(
                          banner.badge,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.surface,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    banner.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: first ? TextAlign.center : TextAlign.left,
                    style: AppTypography.shopTitle.copyWith(height: 1.15),
                  ),
                  if (first) const SizedBox(height: AppSpacing.xl),
                  if (first)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.pill,
                        ),
                        child: _CoverPhoto(banner: banner, shopMark: true),
                      ),
                    )
                  else
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage(
                              'assets/images/product_strawberry_cutout.png',
                            ),
                            height: AppSpacing.shopList,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoverPhoto extends StatelessWidget {
  const _CoverPhoto({required this.banner, required this.shopMark});

  final PromoBanner banner;
  final bool shopMark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppSpacing.fieldRadius),
            ),
            child: AppImage(asset: banner.imageAsset, url: banner.imageUrl),
          ),
        ),
        if (shopMark)
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.fieldRadius),
                ),
                border: Border.fromBorderSide(
                  BorderSide(color: AppColors.surface, width: 1),
                ),
              ),
            ),
          ),
        if (shopMark)
          const Positioned(
            top: -AppSpacing.chip,
            left: 0,
            right: 0,
            child: Center(child: _ShopLogo()),
          ),
      ],
    );
  }
}
