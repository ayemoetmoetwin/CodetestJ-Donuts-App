part of 'app_shell.dart';

class _WalletPainter extends CustomPainter {
  const _WalletPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeJoin = StrokeJoin.round;
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.16,
        size.height * 0.22,
        size.width * 0.68,
        size.height * 0.56,
      ),
      const Radius.circular(3),
    );
    canvas.drawRRect(body, paint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.46,
          size.height * 0.40,
          size.width * 0.28,
          size.height * 0.20,
        ),
        const Radius.circular(2),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _WalletPainter oldDelegate) =>
      oldDelegate.color != color;
}

class _CrownPainter extends CustomPainter {
  const _CrownPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(size.width * 0.12, size.height * 0.72)
      ..lineTo(size.width * 0.22, size.height * 0.38)
      ..lineTo(size.width * 0.38, size.height * 0.56)
      ..lineTo(size.width * 0.50, size.height * 0.24)
      ..lineTo(size.width * 0.62, size.height * 0.56)
      ..lineTo(size.width * 0.78, size.height * 0.38)
      ..lineTo(size.width * 0.88, size.height * 0.72)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CrownPainter oldDelegate) =>
      oldDelegate.color != color;
}
