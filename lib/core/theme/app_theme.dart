import 'package:flutter/material.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';

abstract final class AppTypography {
  static const family = 'PlusJakartaSans';
  static const fallback = ['NotoSansMyanmar'];
  static const logoScale = 0.16;

  static const hiddenInput = TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontSize: 1,
    color: AppColors.transparent,
  );

  static const splash = TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 32,
    color: AppColors.text,
  );

  static TextStyle get display => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 34,
    height: 1.15,
    color: AppColors.text,
  );

  static TextStyle get title => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 28,
    height: 1.2,
    color: AppColors.text,
  );

  static TextStyle get section => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.text,
  );

  static TextStyle get body => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.4,
    color: AppColors.textMuted,
  );

  static TextStyle get button => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    letterSpacing: 1.1,
    color: AppColors.surface,
  );

  static TextStyle get memberName => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 28,
    height: 1.05,
    color: AppColors.ink,
  );

  static TextStyle get rewardTitle => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 26,
    color: AppColors.ink,
  );

  static TextStyle get shopTitle => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 22,
    height: 1.2,
    color: AppColors.surface,
  );

  static TextStyle get bannerTitle => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    height: 1.15,
    color: AppColors.surface,
  );

  static TextStyle get cardTitle => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.ink,
  );

  static TextStyle get label => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.text,
  );

  static TextStyle get caption => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: AppColors.textMuted,
  );

  static TextStyle get small => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.25,
    color: AppColors.textMuted,
  );

  static TextStyle get badgeCount => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w800,
    fontSize: 10,
    color: AppColors.ink,
  );

  static TextStyle get micro => const TextStyle(
    fontFamily: family,
    fontFamilyFallback: fallback,
    fontWeight: FontWeight.w700,
    fontSize: 11,
    color: AppColors.textMuted,
  );
}

ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.cyan,
    primary: AppColors.cyan,
    onPrimary: AppColors.surface,
    secondary: AppColors.pink,
    surface: AppColors.surface,
    error: AppColors.danger,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppTypography.family,
    textTheme: TextTheme(
      headlineMedium: AppTypography.title,
      titleLarge: AppTypography.section,
      bodyMedium: AppTypography.body,
      labelLarge: AppTypography.button,
    ),
    splashColor: AppColors.pinkSoft,
  );
}
