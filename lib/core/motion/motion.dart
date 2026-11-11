import 'package:flutter/material.dart';

abstract final class Motion {
  static const instant = Duration(milliseconds: 120);
  static const fast = Duration(milliseconds: 220);
  static const medium = Duration(milliseconds: 420);
  static const slow = Duration(milliseconds: 700);
  static const entrance = Duration(milliseconds: 900);
  static const ring = Duration(milliseconds: 1100);
  static const countUp = Duration(milliseconds: 1400);
  static const stagger = Duration(milliseconds: 90);
  static const pressScale = 0.96;
  static const standard = Curves.easeOutCubic;
  static const emphasized = Curves.easeInOutCubic;
  static const overshoot = Curves.easeOutBack;
}

bool get underTest =>
    WidgetsBinding.instance.runtimeType.toString().contains('Test');

bool motionAllowed(BuildContext context) {
  if (underTest) {
    return false;
  }
  final ticker = TickerMode.valuesOf(context);
  return !MediaQuery.disableAnimationsOf(context) && ticker.enabled;
}

Duration motionOf(BuildContext context, Duration duration) {
  if (motionAllowed(context)) {
    return duration;
  }
  return Duration.zero;
}
