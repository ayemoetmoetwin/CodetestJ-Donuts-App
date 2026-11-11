part of '../home_screen.dart';

class _ShopLogo extends StatelessWidget {
  const _ShopLogo();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: AppSpacing.pill,
      height: AppSpacing.pill,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
        ),
        child: CustomPaint(painter: _ShopLogoPainter()),
      ),
    );
  }
}

class _ShopLogoPainter extends CustomPainter {
  const _ShopLogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final pink = Paint()..color = AppColors.pink;
    final arch = Path()
      ..moveTo(w * 0.34, h * 0.72)
      ..lineTo(w * 0.34, h * 0.48)
      ..quadraticBezierTo(w * 0.34, h * 0.34, w * 0.50, h * 0.34)
      ..quadraticBezierTo(w * 0.66, h * 0.34, w * 0.66, h * 0.48)
      ..lineTo(w * 0.66, h * 0.72)
      ..close();
    canvas.drawPath(arch, pink);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.43, h * 0.52, w * 0.14, h * 0.20),
        Radius.circular(w * 0.03),
      ),
      Paint()..color = AppColors.surface,
    );
    final word = TextPainter(
      text: TextSpan(
        text: "J'DONUT",
        style: AppTypography.shopTitle.copyWith(
          color: AppColors.pink,
          fontSize: w * AppTypography.logoScale,
          letterSpacing: -0.4,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: w * 0.9);
    word.paint(canvas, Offset((w - word.width) / 2, h * 0.16));
  }

  @override
  bool shouldRepaint(covariant _ShopLogoPainter oldDelegate) => false;
}

class _SprinklePainter extends CustomPainter {
  const _SprinklePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.sprinkle
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final w = size.width;
    final h = size.height;
    final lines = <(Offset, Offset)>[
      (Offset(w * 0.08, h * 0.16), Offset(w * 0.13, h * 0.09)),
      (Offset(w * 0.2, h * 0.28), Offset(w * 0.24, h * 0.2)),
      (Offset(w * 0.1, h * 0.62), Offset(w * 0.15, h * 0.54)),
      (Offset(w * 0.22, h * 0.82), Offset(w * 0.27, h * 0.74)),
      (Offset(w * 0.72, h * 0.12), Offset(w * 0.78, h * 0.06)),
      (Offset(w * 0.86, h * 0.22), Offset(w * 0.91, h * 0.15)),
      (Offset(w * 0.78, h * 0.4), Offset(w * 0.84, h * 0.32)),
      (Offset(w * 0.9, h * 0.58), Offset(w * 0.95, h * 0.5)),
      (Offset(w * 0.7, h * 0.78), Offset(w * 0.76, h * 0.7)),
      (Offset(w * 0.46, h * 0.08), Offset(w * 0.5, h * 0.02)),
    ];
    for (final (start, end) in lines) {
      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SprinklePainter oldDelegate) => false;
}
