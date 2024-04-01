import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_quest_architecture/core/logger.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

const someConst = 0.75;
class HoverTiltWidget extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovering) builder;

  const HoverTiltWidget({
    super.key,
    required this.builder,
  });

  @override
  State<HoverTiltWidget> createState() => _HoverTiltWidgetState();
}

class _HoverTiltWidgetState extends State<HoverTiltWidget> {
  double currentY = 0.0;
  double currentX = 0.0;
  double beginX = 0.0;
  double endX = 0.0;
  double beginY = 0.0;
  double endY = 0.0;
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double borderValueX = constraints.maxWidth;
        double borderValueY = constraints.maxHeight;
        return TweenAnimationBuilder(
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
          tween: Tween(
            begin: beginY,
            end: endY,
          ),
          builder: (context, valueX, child) => TweenAnimationBuilder(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
            tween: Tween(
              begin: beginX,
              end: endX,
            ),
            builder: (context, valueY, child) {
              return Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(valueX)
                      ..rotateY(valueY),
                    alignment: FractionalOffset.center,
                    child: MouseRegion(
                      onHover: (details) {
                        double calculateXValue(double dx, double borderValueX) {
                          return ((borderValueY / 2) - dx) * -1;
                        }

                        double xValue = calculateXValue(
                            details.localPosition.dx, borderValueX);
                        double yValue = calculateXValue(
                            details.localPosition.dy, borderValueY);
                        setState(() {
                          isHovering = true;
                          double oldRange = (borderValueX - (-borderValueX));
                          double newRange = (someConst - (-someConst));
                          double newValue =
                              (((xValue - (-borderValueX)) * newRange) /
                                      oldRange) +
                                  (-someConst);
                          beginX = currentX;
                          currentX = newValue;
                          endX = currentX;
                          oldRange = (borderValueY - (-borderValueY));
                          newRange = (someConst - (-someConst));
                          newValue = (((-yValue - (-borderValueY)) * newRange) /
                                  oldRange) +
                              (-someConst);
                          beginY = currentY;
                          currentY = newValue;
                          endY = currentY;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          isHovering = false;
                          currentX = 0.0;
                          currentY = 0.0;
                          beginX = 0.0;
                          endX = 0.0;
                          beginY = 0.0;
                          endY = 0.0;
                        });
                      },
                      child: widget.builder.call(context, isHovering),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    )
        .animate(target: isHovering ? 1 : 0)
        .moveY(begin: 0, end: -16)
        .fade(begin: 0.8, end: 1)
        .scaleXY(begin: 0.9, end: 1)
        .shimmer(
          color: context.colorScheme.secondaryContainer.withOpacity(0.5),
        );
  }
}

class Elevated extends StatelessWidget {
  final double elevation;
  final Widget child;

  const Elevated({
    super.key,
    this.elevation = 15,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..translate(0.0, 0.0, -1 * elevation),
      child: child,
    );
  }
}
