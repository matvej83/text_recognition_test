import 'package:flutter/material.dart';

class CardOverlayPainter extends CustomPainter {

  CardOverlayPainter(this.cardDetected);
  final bool cardDetected;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()..color = Colors.black.withValues(alpha: 0.5);
    final Paint borderPaint = Paint()
      ..color = cardDetected ? Colors.green : Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Rect fullScreen = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect cardRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width * 0.8,
        height: size.height * 0.25,
      ),
      const Radius.circular(20),
    );

    final Path backgroundPath = Path()
      ..addRect(fullScreen) // Full-screen background
      ..addRRect(cardRRect) // Rounded rectangle cutout
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(backgroundPath, backgroundPaint); // Draw dimmed background
    canvas.drawRRect(cardRRect, borderPaint); // Draw rounded rectangle border
  }

  @override
  bool shouldRepaint(CardOverlayPainter oldDelegate) {
    return oldDelegate.cardDetected != cardDetected;
  }
}
