import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/core/theme/app_colors.dart';
import 'package:jdonuts_app/core/theme/app_spacing.dart';
import 'package:jdonuts_app/core/theme/app_theme.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:jdonuts_app/features/auth/presentation/widgets/otp_boxes.dart';
import 'package:jdonuts_app/l10n/generated/app_localizations.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    required this.title,
    required this.body,
    this.progress,
    this.showCheck = false,
    this.footer,
    super.key,
  });

  final String title;
  final Widget body;
  final double? progress;
  final bool showCheck;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.authTop, AppColors.surface],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPadding,
              AppSpacing.sm,
              AppSpacing.screenPadding,
              AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _BackButton(onPressed: () => context.pop()),
                    const Spacer(),
                    if (progress != null)
                      ProgressRing(progress: progress!, showCheck: showCheck),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(title, style: AppTypography.title),
                const SizedBox(height: AppSpacing.lg),
                Expanded(child: body),
                ?footer,
                const SizedBox(height: AppSpacing.md),
                LegalLine(l10n: l10n),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const _backExtent = 44.0;
const _backIcon = 22.0;

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        child: const SizedBox(
          width: _backExtent,
          height: _backExtent,
          child: Icon(Icons.arrow_back, color: AppColors.ink, size: _backIcon),
        ),
      ),
    );
  }
}

class LegalLine extends StatelessWidget {
  const LegalLine({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final style = AppTypography.micro.copyWith(fontWeight: FontWeight.w500);
    final link = style.copyWith(color: AppColors.pink);
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: l10n.legalLead),
          WidgetSpan(
            child: GestureDetector(
              onTap: () => showComingSoon(context),
              child: Text(l10n.terms, style: link),
            ),
          ),
          TextSpan(text: l10n.legalAnd),
          WidgetSpan(
            child: GestureDetector(
              onTap: () => showComingSoon(context),
              child: Text(l10n.privacy, style: link),
            ),
          ),
          TextSpan(text: l10n.legalEnd),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class AuthField extends StatefulWidget {
  const AuthField({
    required this.hint,
    required this.onChanged,
    this.initialValue = '',
    this.error,
    this.prefix,
    this.keyboardType,
    this.inputFormatters,
    this.onUnfocus,
    super.key,
  });

  final String hint;
  final ValueChanged<String> onChanged;
  final String initialValue;
  final String? error;
  final String? prefix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onUnfocus;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialValue,
  );
  late final FocusNode _focus = FocusNode()..addListener(_onFocus);
  late String _published = widget.initialValue;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_publish);
  }

  @override
  void dispose() {
    _controller.removeListener(_publish);
    _focus
      ..removeListener(_onFocus)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _publish() {
    final text = _controller.text;
    if (text == _published) {
      return;
    }
    _published = text;
    widget.onChanged(text);
  }

  void _onFocus() {
    if (!_focus.hasFocus) {
      widget.onUnfocus?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final error = widget.error;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focus,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onTapOutside: (_) => _focus.unfocus(),
          style: AppTypography.section.copyWith(fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTypography.section.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
            prefixText: widget.prefix,
            prefixStyle: AppTypography.section.copyWith(
              fontWeight: FontWeight.w700,
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            enabledBorder: _border(
              error == null ? AppColors.line : AppColors.danger,
            ),
            focusedBorder: _border(
              error == null ? AppColors.cyan : AppColors.danger,
            ),
            errorBorder: _border(AppColors.danger),
            focusedErrorBorder: _border(AppColors.danger),
          ),
        ),
        if (error != null && error.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xs,
              left: AppSpacing.xs,
            ),
            child: Text(
              error,
              style: AppTypography.body.copyWith(color: AppColors.danger),
            ),
          ),
      ],
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
      borderSide: BorderSide(color: color),
    );
  }
}
