
import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

class CanvasBackground extends StatelessWidget {
  final Widget? child;

  const CanvasBackground({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final firstColor = context.colorScheme.background;
    final secondColor = context.colorScheme.surfaceVariant;
    if (child == null) {
      return CustomPaint(
        painter: CanvasPainter(
          firstColor: firstColor,
          secondColor: secondColor,
        ), // Adjust size as needed
      );
    }
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: CanvasPainter(
              firstColor: firstColor,
              secondColor: secondColor,
            ), // Adjust size as needed
          ),
        ),
        child!,
      ],
    );
  }
}

class CanvasPainter extends CustomPainter {
  final Color firstColor;
  final Color secondColor;

  CanvasPainter({
    super.repaint,
    required this.secondColor,
    required this.firstColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const cellSize = 15.0; // Size of each square
    final numHorizontalCells = (size.width / cellSize).ceil();
    final numVerticalCells = (size.height / cellSize).ceil();
    final paint = Paint()..style = PaintingStyle.fill;

    for (int y = 0; y < numVerticalCells; y++) {
      for (int x = 0; x < numHorizontalCells; x++) {
        final color = (x + y) % 2 == 0 ? firstColor : secondColor;
        paint.color = color;
        bool isLastHorizontal = x == numHorizontalCells;
        bool isLastVertical = y == numVerticalCells;

        final cellWidth = isLastHorizontal ? size.width % cellSize : cellSize;
        final cellHeight = isLastVertical ? size.height % cellSize : cellSize;
        canvas.drawRect(
          Rect.fromLTWH(
            x * cellSize,
            y * cellSize,
            cellWidth,
            cellHeight,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
