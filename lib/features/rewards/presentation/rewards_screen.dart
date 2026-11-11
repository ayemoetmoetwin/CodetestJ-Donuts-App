import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/format/money.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/core/widgets/app_button.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/features/home/presentation/catalog_providers.dart';
import 'package:jdonuts_app/features/rewards/domain/entities/rewards_snapshot.dart';
import 'package:jdonuts_app/features/rewards/domain/member_tier.dart';
import 'package:jdonuts_app/features/rewards/presentation/widgets/reward_painters.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

part 'widgets/rewards_tabs.dart';
part 'widgets/challenge_card.dart';
part 'widgets/challenge_art.dart';
part 'widgets/challenge_celebrate.dart';
part 'widgets/challenge_earn.dart';
part 'widgets/rewards_body.dart';

class RewardsScreen extends ConsumerStatefulWidget {
  const RewardsScreen({super.key});

  @override
  ConsumerState<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends ConsumerState<RewardsScreen>
    with TickerProviderStateMixin {
  var _gift = false;
  var _toGift = false;
  var _crossfade = false;
  var _generation = 0;
  var _cardToken = 0;
  var _opened = false;
  var _countFrom = 0;
  int? _total;
  int? _badge;
  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: Motion.entrance,
  );

  @override
  void reassemble() {
    super.reassemble();
    ref.invalidate(rewardsProvider);
  }

  @override
  void dispose() {
    _enter.dispose();
    super.dispose();
  }

  void _replay() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final allow = motionAllowed(context);
      setState(() {
        _countFrom = 0;
        _generation++;
        _cardToken++;
        _crossfade = false;
      });
      if (allow) {
        _enter.forward(from: 0);
        return;
      }
      _enter.value = 1;
    });
  }

  void _switchTab(bool gift) {
    if (_gift == gift) {
      return;
    }
    setState(() {
      _toGift = gift;
      _gift = gift;
      _cardToken++;
      _crossfade = true;
    });
  }

  RewardsSnapshot _view(RewardsSnapshot snapshot) {
    final points = _total ?? snapshot.points;
    final standing = MemberStanding.fromPoints(points);
    return RewardsSnapshot(
      memberName: snapshot.memberName,
      tier: standing.tier,
      points: points,
      pointsToNext: standing.pointsToNext,
      nextTier: standing.nextTier,
      tierProgress: standing.progress,
      rewardsBadge: _badge ?? snapshot.rewardsBadge,
      challenges: snapshot.challenges,
    );
  }

  Future<void> _earn(Challenge challenge, RewardsSnapshot snapshot) async {
    if (!challenge.canClaim) {
      return;
    }
    final current = _total ?? snapshot.points;
    final result = await ref
        .read(rewardsRepositoryProvider)
        .claim(challenge.id);
    if (!mounted) {
      return;
    }
    final saved = result.when(success: (value) => value, failure: (_) => null);
    if (saved == null) {
      return;
    }
    final counted = saved.badge != snapshot.rewardsBadge;
    setState(() {
      _countFrom = current;
      _total = saved.points;
      _badge = saved.badge;
      if (counted || saved.points != current) {
        _generation++;
      }
    });
    ref.invalidate(rewardsProvider);
    ref.invalidate(homeProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(shellBranchProvider, (previous, next) {
      if (next == 2 && previous != 2) {
        _replay();
      }
    });
    final rewards = ref.watch(rewardsProvider);
    return ColoredBox(
      color: AppColors.canvas,
      child: rewards.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => _Error(onRetry: () => ref.invalidate(rewardsProvider)),
        data: (result) => result.when(
          success: (snapshot) {
            if (!_opened) {
              _opened = true;
              _replay();
            }
            final view = _view(snapshot);
            return _Body(
              snapshot: view,
              countFrom: _countFrom,
              gift: _gift,
              toGift: _toGift,
              crossfade: _crossfade,
              generation: _generation,
              cardToken: _cardToken,
              enter: _enter,
              onTab: _switchTab,
              onEarn: (challenge) => _earn(challenge, snapshot),
            );
          },
          failure: (_) =>
              _Error(onRetry: () => ref.invalidate(rewardsProvider)),
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({required this.onRetry});

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
