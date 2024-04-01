import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/explorer_page.dart';
import 'package:flutter_quest_architecture/core/explorable_widget.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:provider/provider.dart';

import 'canvas_background.dart';
import 'hover_tilt_widget.dart';

class ExploreWidgetCard extends StatelessWidget {
  final ExplorableWidget widget;

  const ExploreWidgetCard({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 455,
      width: 355,
      child: GestureDetector(
        onTap: () {
          context.read<ActiveWidgetNotifier>().update(explorable: widget);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const WidgetExplorerPage(),
            ),
          );
        },
        child: HoverTiltWidget(
          builder: (_, isHovering) {
            return _ExploreWidgetContent(
              isHovering: isHovering,
              widget: widget,
            );
          },
        ),
      ),
    );
  }
}

class _ExploreWidgetContent extends StatelessWidget {
  final bool isHovering;
  final ExplorableWidget widget;

  const _ExploreWidgetContent({
    required this.isHovering,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final titleBar = Hero(
      tag: "title-${widget.title}",
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: Center(
            child: Elevated(
              elevation: 15,
              child: Text(
                widget.title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    final canvasAndPreview = Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        margin: EdgeInsets.all(isHovering?8:16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isHovering
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Hero(
            tag: "canvas-${widget.title}",
            child: CanvasBackground(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    bottom: 16,
                    right: 24,
                  ),
                  child: Elevated(
                    elevation: 30,
                    child: widget.widget,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    final descriptionCard = AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 12),
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isHovering
              ? context.colorScheme.primary
              : context.colorScheme.outline,
        ),
      ),
      width: double.maxFinite,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 100,
        ),
        child: Elevated(
          elevation: 15,
          child: Text(
            widget.description,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
    return Card(
      elevation: isHovering ? 16 : 4,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          titleBar,
          canvasAndPreview,
          descriptionCard,
        ],
      ),
    );
  }
}
