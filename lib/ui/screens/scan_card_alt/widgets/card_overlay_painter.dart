import 'package:flutter/material.dart';

/// Paints the card detection overlay

class CardOverlayPainter extends CustomPainter {
  final bool cardDetected;

  CardOverlayPainter(this.cardDetected);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()..color = Colors.black.withOpacity(0.5);
    final Paint borderPaint = Paint()
      ..color = cardDetected ? Colors.green : Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Rect fullScreen = Rect.fromLTWH(0, 0, size.width, size.height);
    final Rect cardRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.8,
      height: size.height * 0.25,
    );

    final Path backgroundPath = Path()
      ..addRect(fullScreen)
      ..addRect(cardRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(backgroundPath, backgroundPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(cardRect, const Radius.circular(20)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CardOverlayPainter oldDelegate) {
    return oldDelegate.cardDetected != cardDetected;
  }
}
