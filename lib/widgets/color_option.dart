import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/constants.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

class ColorOptionBox extends StatefulWidget {
  final Function(Color)? onUpdated;
  final Color fillColor;
  final bool isSelected;
  final bool dense;

  const ColorOptionBox({
    super.key,
    required this.fillColor,
    this.isSelected = false,
    this.onUpdated,
    this.dense = false,
  });

  @override
  State<ColorOptionBox> createState() => _ColorOptionBoxState();
}

class _ColorOptionBoxState extends State<ColorOptionBox> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onUpdated?.call(widget.fillColor),
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: Container(
        height: widget.dense ? kElementHeightDense : kElementHeight,
        width: widget.dense ? kElementHeightDense : kElementHeight,
        decoration: BoxDecoration(
          color: widget.fillColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: isHovering
                ? ((widget.fillColor.computeLuminance() > 0.179)
                        ? Colors.black
                        : Colors.white)
                    .withOpacity(0.3)
                : Colors.transparent,
          ),
          child: widget.isSelected
              ? const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class ColorOptionCircle extends StatefulWidget {
  final Function(Color)? onUpdated;
  final Color fillColor;
  final bool isSelected;

  const ColorOptionCircle({
    super.key,
    required this.fillColor,
    this.isSelected = false,
    this.onUpdated,
  });

  @override
  State<ColorOptionCircle> createState() => _ColorOptionCircleState();
}

class _ColorOptionCircleState extends State<ColorOptionCircle> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onUpdated?.call(widget.fillColor),
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.fillColor,
          shape: BoxShape.circle,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isHovering
                ? ((widget.fillColor.computeLuminance() > 0.179)
                        ? Colors.black
                        : Colors.white)
                    .withOpacity(0.3)
                : Colors.transparent,
            border: Border.all(color: context.colorScheme.outline),
          ),
          child: widget.isSelected
              ? const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
