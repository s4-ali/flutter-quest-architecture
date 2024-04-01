import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/widgets.providers.g.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/core/editor.dart';
import 'package:flutter_quest_architecture/widgets/title_container.dart';
import 'package:provider/provider.dart';

class WidgetsList extends StatelessWidget {
  const WidgetsList({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetsList = explorableWidgets.values.toList();

    return ListView.builder(
      itemCount: widgetsList.length,
      itemBuilder: (BuildContext context, int index) {
        final widget = widgetsList[index];
        return ListTile(
          title: Text(widget.title),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => WidgetEditorPage(widget: widget),
            ),
          ),
        );
      },
    );
  }
}

class WidgetsListDrawer extends StatelessWidget {
  const WidgetsListDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ActiveWidgetNotifier>(
      builder: (_, activeWidgetNotifier, __) {
        final widgetsList = explorableWidgets.values.toList();
        return NavigationDrawer(
          onDestinationSelected: (index) {
            final currentIndex =
                widgetsList.indexOf(activeWidgetNotifier.explorable);
            context.read<PageController>().animateToPage(
                  index,
                  duration: Duration(
                    milliseconds: (currentIndex - index).abs() * 750,
                  ),
                  curve: Curves.easeIn,
                );
            context
                .read<ActiveWidgetNotifier>()
                .update(explorable: widgetsList[index]);
          },
          selectedIndex: widgetsList.indexOf(activeWidgetNotifier.explorable),
          children: [
            const TitleContainer(title: "Widgets"),
            const SizedBox(
              height: 16,
            ),
            ...(widgetsList
                .map(
                  (e) => NavigationDrawerDestination(
                    icon: const SizedBox(),
                    label: Text(e.title),
                  ),
                )
                .toList()),
          ],
        );
      },
    );
  }
}
