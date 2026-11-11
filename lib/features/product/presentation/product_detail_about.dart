part of 'product_detail_screen.dart';

class _About extends StatelessWidget {
  const _About({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 74,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.questionGreen,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: Icon(
                      Icons.question_mark_rounded,
                      color: AppColors.surface,
                      size: 10,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  title,
                  style: AppTypography.label.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w800,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          const ColoredBox(color: AppColors.surface, child: SizedBox(width: 1)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              body,
              style: AppTypography.caption.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.w400,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({required this.quantity, required this.onChanged});

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.canvas,
        borderRadius: BorderRadius.circular(AppSpacing.pill),
        border: Border.all(color: AppColors.surface, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StepButton(
              icon: Icons.remove,
              onPressed: quantity > 1 ? () => onChanged(quantity - 1) : null,
            ),
            SizedBox(
              width: 72,
              child: AnimatedSwitcher(
                duration: motionOf(context, Motion.fast),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  '$quantity',
                  key: ValueKey(quantity),
                  textAlign: TextAlign.center,
                  style: AppTypography.section.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            _StepButton(
              icon: Icons.add,
              onPressed: () => onChanged(quantity + 1),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.stepBlue,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(icon, color: AppColors.surface, size: 18),
        ),
      ),
    );
  }
}

class _Missing extends StatelessWidget {
  const _Missing({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.loadError),
            TextButton(onPressed: onRetry, child: Text(l10n.retry)),
          ],
        ),
      ),
    );
  }
}
