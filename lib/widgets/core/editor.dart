import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/widgets.providers.g.dart';
import 'package:flutter_quest_architecture/core/explorable_widget.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/canvas_background.dart';
import 'package:flutter_quest_architecture/widgets/hover_builder.dart';
import 'package:flutter_quest_architecture/widgets/title_container.dart';
import 'package:flutter_quest_architecture/widgets/title_container_with_theme.dart';
import 'package:provider/provider.dart';

class WidgetEditorPage extends StatelessWidget {
  final ExplorableWidget widget;

  const WidgetEditorPage({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return widget.widget;
  }
}

class WidgetEditor extends StatefulWidget {
  const WidgetEditor({
    super.key,
  });

  @override
  State<WidgetEditor> createState() => _WidgetEditorState();
}

class _WidgetEditorState extends State<WidgetEditor>
    with TickerProviderStateMixin {
  ActiveWidgetNotifier? currentNotifier;

  Widget buildAppBar(ActiveWidgetNotifier notifier, BuildContext context) {
    final titleBar = Hero(
      tag: "title-${notifier.explorable.title}",
      child: TitleContainerWithTheme(
        title: notifier.explorable.title,
      ),
    );

    return Column(
      children: [
        titleBar,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TabBar(
                tabs: [
                  Tab(
                    text: "Widget",
                  ),
                  Tab(
                    text: "Code",
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ActiveWidgetNotifier>(
      builder: (_, notifier, __) {
        return DefaultTabController(
          length: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    buildAppBar(notifier, context),
                    Expanded(
                      child: PageView.builder(
                        pageSnapping: false,
                        scrollDirection: Axis.vertical,
                        itemCount: explorableWidgets.length,
                        controller: context.read<PageController>(),
                        onPageChanged: (index) {
                          context.read<ActiveWidgetNotifier>().update(
                              explorable:
                                  explorableWidgets.values.toList()[index]);
                        },
                        itemBuilder: (context, index) {
                          final widget =
                              explorableWidgets.values.toList()[index];
                          return TabBarView(
                            children: [
                              WidgetPreview(
                                widget,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: widget.code,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              notifier.explorable.drawer,
            ],
          ),
        );
      },
    );
  }
}

class WidgetPreview extends StatelessWidget {
  final ExplorableWidget notifier;

  const WidgetPreview(
    this.notifier, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: HoverBuilder<bool>(
        value: (val) => val,
        builder: (isHovering) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: isHovering
                    ? context.colorScheme.primary
                    : context.colorScheme.outline,
                width: isHovering ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: "canvas-${notifier.title}",
                child: CanvasBackground(
                  child: Center(child: notifier.widget),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
