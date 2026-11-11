import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/motion/motion.dart';

CustomTransitionPage<void> sharedAxisPage({
  required LocalKey pageKey,
  required Widget child,
  required bool reduced,
}) {
  final duration = reduced ? Duration.zero : Motion.medium;
  return CustomTransitionPage<void>(
    key: pageKey,
    opaque: true,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondary, child) {
      final incoming = CurveTween(curve: Motion.emphasized).animate(animation);
      final outgoing = CurveTween(curve: Motion.emphasized).animate(secondary);
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-0.28, 0),
        ).animate(outgoing),
        child: FadeTransition(
          opacity: Tween<double>(begin: 1, end: 0.2).animate(outgoing),
          child: FadeTransition(
            opacity: incoming,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.28, 0),
                end: Offset.zero,
              ).animate(incoming),
              child: child,
            ),
          ),
        ),
      );
    },
  );
}

CustomTransitionPage<void> homeArrivalPage({
  required LocalKey pageKey,
  required Widget child,
  required bool reduced,
}) {
  final duration = reduced ? Duration.zero : Motion.slow;
  return CustomTransitionPage<void>(
    key: pageKey,
    opaque: true,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondary, child) {
      final incoming = CurveTween(curve: Motion.emphasized).animate(animation);
      final outgoing = CurveTween(curve: Motion.emphasized).animate(secondary);
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(-0.22, 0),
        ).animate(outgoing),
        child: FadeTransition(
          opacity: Tween<double>(begin: 1, end: 0).animate(outgoing),
          child: FadeTransition(
            opacity: incoming,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.18, 0.06),
                end: Offset.zero,
              ).animate(incoming),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.96, end: 1).animate(incoming),
                child: child,
              ),
            ),
          ),
        ),
      );
    },
  );
}

bool reducedMotion(BuildContext context) {
  return underTest || MediaQuery.disableAnimationsOf(context);
}
