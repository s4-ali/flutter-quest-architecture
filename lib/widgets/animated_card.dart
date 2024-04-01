import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

import 'hover_builder.dart';

typedef HoveringProperties = ({
  double borderRadius,
  double elevation,
});

class AnimatedCard extends StatefulWidget {
  final Widget child;

  const AnimatedCard({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  @override
  Widget build(BuildContext context) {
    return HoverBuilder<HoveringProperties>(
      value: hoveringPropertiesBuilder,
      builder: (HoveringProperties val) {
        return Material(
          animationDuration: const Duration(milliseconds: 450),
          elevation: val.elevation,
          color: context.theme.colorScheme.surface,
          shadowColor: context.theme.colorScheme.shadow,
          surfaceTintColor: context.theme.colorScheme.surfaceTint,
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(val.borderRadius),
          child: widget.child,
        );
      },
    );
  }

  HoveringProperties hoveringPropertiesBuilder(isHovering) {
    return (
      borderRadius: isHovering ? 16 : 12,
      elevation: isHovering ? 4 : 1,
    );
  }
}
