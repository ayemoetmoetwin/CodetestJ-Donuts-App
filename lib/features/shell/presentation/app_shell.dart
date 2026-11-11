import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/motion/motion.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/features/auth/presentation/session_controller.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

part 'nav_painters.dart';
part 'nav_bar.dart';

class AppShell extends ConsumerWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shown = navigationShell.currentIndex == 3
        ? 0
        : navigationShell.currentIndex;
    if (navigationShell.currentIndex == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        navigationShell.goBranch(0);
      });
    }
    if (ref.read(shellBranchProvider) != shown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(shellBranchProvider.notifier).state = shown;
      });
    }
    return Scaffold(
      extendBody: true,
      body: _ShellBody(index: shown, child: navigationShell),
      bottomNavigationBar: _NavBar(
        index: shown,
        onTap: (index) {
          ref.read(shellBranchProvider.notifier).state = index;
          navigationShell.goBranch(index, initialLocation: index == shown);
        },
      ),
    );
  }
}

class _FloatingPill extends StatefulWidget {
  const _FloatingPill({required this.child});

  final Widget child;

  @override
  State<_FloatingPill> createState() => _FloatingPillState();
}

class _FloatingPillState extends State<_FloatingPill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _motion = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (motionAllowed(context)) {
      if (!_motion.isAnimating) {
        _motion.repeat(reverse: true);
      }
      return;
    }
    _motion.stop();
    _motion.value = 0;
  }

  @override
  void dispose() {
    _motion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _motion,
      child: widget.child,
      builder: (context, child) {
        final t = _motion.value;
        final lift = -5 * Curves.easeInOut.transform(t);
        final shake = math.sin(t * math.pi * 2) * 2.2;
        return Transform.translate(
          offset: Offset(shake, lift),
          child: Transform.rotate(angle: shake * 0.012, child: child),
        );
      },
    );
  }
}

class _ShellBody extends StatefulWidget {
  const _ShellBody({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  State<_ShellBody> createState() => _ShellBodyState();
}

class _ShellBodyState extends State<_ShellBody>
    with SingleTickerProviderStateMixin {
  static const _visual = [0, 2, 1, 4];

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Motion.medium,
    value: 1,
  );
  var _forward = true;

  @override
  void didUpdateWidget(covariant _ShellBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index == oldWidget.index) {
      return;
    }
    final next = _visual.indexOf(widget.index);
    final previous = _visual.indexOf(oldWidget.index);
    _forward = next >= previous;
    if (!motionAllowed(context)) {
      _controller.value = 1;
      return;
    }
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        final t = Motion.standard.transform(_controller.value);
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset((1 - t) * 36 * (_forward ? 1 : -1), 0),
            child: child,
          ),
        );
      },
    );
  }
}

enum _SlotKind { home, reward, order, inbox, settings }

class _Slot {
  const _Slot({required this.branch, required this.kind});

  final int branch;
  final _SlotKind kind;
}

String _label(AppLocalizations l10n, _SlotKind kind) {
  return switch (kind) {
    _SlotKind.home => l10n.home,
    _SlotKind.reward => l10n.reward,
    _SlotKind.order => l10n.cart,
    _SlotKind.inbox => l10n.inbox,
    _SlotKind.settings => l10n.settings,
  };
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.slot,
    required this.hidden,
    required this.onTap,
  });

  final _Slot slot;
  final bool hidden;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: _slotName(slot.kind),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedOpacity(
          duration: motionOf(context, Motion.fast),
          curve: Motion.standard,
          opacity: hidden ? 0 : 1,
          child: Center(
            child: _NavIcon(kind: slot.kind, color: AppColors.surface),
          ),
        ),
      ),
    );
  }
}

String _slotName(_SlotKind kind) {
  return switch (kind) {
    _SlotKind.home => 'Home',
    _SlotKind.reward => 'Reward',
    _SlotKind.order => 'Cart',
    _SlotKind.inbox => 'Inbox',
    _SlotKind.settings => 'Settings',
  };
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.kind, required this.color});

  final _SlotKind kind;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final icon = switch (kind) {
      _SlotKind.home => Icons.home_outlined,
      _SlotKind.order => Icons.shopping_cart_outlined,
      _SlotKind.settings => Icons.settings_outlined,
      _ => null,
    };
    if (icon != null) {
      return Icon(icon, color: color, size: 26);
    }
    return CustomPaint(
      size: const Size(26, 26),
      painter: switch (kind) {
        _SlotKind.reward => _CrownPainter(color),
        _ => _WalletPainter(color),
      },
    );
  }
}

class PlaceholderTab extends StatelessWidget {
  const PlaceholderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppLocalizations.of(context).placeholderBody));
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.settings, style: AppTypography.section),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(l10n.settingsBody, style: AppTypography.body),
          const SizedBox(height: AppSpacing.lg),
          ListTile(
            key: const Key('logout-button'),
            tileColor: AppColors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radius),
            ),
            title: Text(l10n.logOut),
            trailing: const Icon(Icons.logout_rounded),
            onTap: () async {
              ref.read(showWelcomeProvider.notifier).state = false;
              await ref.read(sessionProvider.notifier).close();
              if (context.mounted) {
                context.go('/onboarding');
              }
            },
          ),
        ],
      ),
    );
  }
}
