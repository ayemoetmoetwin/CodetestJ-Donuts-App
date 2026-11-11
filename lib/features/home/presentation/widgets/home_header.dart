part of '../home_screen.dart';

class _TopBand extends StatelessWidget {
  const _TopBand({
    required this.member,
    required this.banners,
    required this.onRetry,
  });

  final MemberProfile member;
  final Result<List<PromoBanner>> banners;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSpacing.bandOuterLeft),
          bottomRight: Radius.circular(AppSpacing.bandOuterRight),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.stroke),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppSpacing.bandInnerLeft),
            bottomRight: Radius.circular(AppSpacing.bandInnerRight),
          ),
          child: ColoredBox(
            color: AppColors.cream,
            child: Stack(
              children: [
                Positioned(
                  right: -AppSpacing.xxs,
                  top: top + AppSpacing.row,
                  child: const _StarPlate(),
                ),
                Column(
                  children: [
                    SizedBox(height: top),
                    _Header(member: member),
                    banners.when(
                      success: (items) => items.isEmpty
                          ? const _BannerNotice(empty: true)
                          : _Banners(banners: items),
                      failure: (_) =>
                          _BannerNotice(empty: false, onRetry: onRetry),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: top + AppSpacing.notifyTop,
                  child: _NotifyPill(count: member.notificationCount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.member});

  final MemberProfile member;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Tier label comes from the saved points, so Home matches Rewards.
    final standing = MemberStanding.fromPoints(member.points);
    final tier = tierName(l10n, standing.tier);
    final next = tierName(l10n, standing.nextTier);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.xs,
        AppSpacing.lg,
        AppSpacing.tight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _Avatar(asset: member.photoAsset),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: AppSpacing.nameClearance,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.memberName,
                      ),
                      const SizedBox(height: AppSpacing.hairline),
                      Text(
                        l10n.memberTier(tier),
                        style: AppTypography.caption.copyWith(
                          color: AppColors.memberInk,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Align(
            alignment: Alignment.centerLeft,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.pill),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.chip,
                  vertical: AppSpacing.xs,
                ),
                child: Text(
                  l10n.pointsLeft('${standing.pointsToNext}', next),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.caption,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(
                color: AppColors.peach,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.pinkSoft,
              backgroundImage: AssetImage(asset),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotifyPill extends StatelessWidget {
  const _NotifyPill({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.badgeOrange,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(AppSpacing.notifyRadius),
        ),
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.surface, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.chip,
          AppSpacing.xs,
          AppSpacing.md,
          AppSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.notifications_outlined,
              color: AppColors.surface,
              size: AppSpacing.lg,
            ),
            const SizedBox(width: AppSpacing.tight),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 16,
                height: 16,
                child: Center(
                  child: Text(
                    '$count',
                    style: AppTypography.micro.copyWith(
                      color: AppColors.ink,
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarPlate extends StatelessWidget {
  const _StarPlate();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 176,
      height: 210,
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 8,
            child: Transform.rotate(
              angle: -0.22,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.peachDeep,
                  borderRadius: BorderRadius.all(Radius.circular(42)),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.surface, width: 4),
                  ),
                ),
                child: SizedBox(width: 136, height: 150),
              ),
            ),
          ),
          Positioned(
            right: 54,
            top: 58,
            child: Icon(Icons.star_rounded, size: 46, color: AppColors.star),
          ),
        ],
      ),
    );
  }
}
