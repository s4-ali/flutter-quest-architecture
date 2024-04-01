import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/widgets.providers.g.dart';
import 'package:flutter_quest_architecture/catalog/widgets_list.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/animated_card.dart';
import 'package:flutter_quest_architecture/widgets/app_bar.dart';
import 'package:flutter_quest_architecture/widgets/core/editor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WidgetExplorerPage extends StatefulWidget {
  const WidgetExplorerPage({super.key});

  @override
  State<WidgetExplorerPage> createState() => _WidgetExplorerPageState();
}

class _WidgetExplorerPageState extends State<WidgetExplorerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: buildMobile,
      tablet: buildTablet,
      desktop: buildTablet,
      watch: (BuildContext context) => Container(color: Colors.purple),
    );
  }

  Widget buildMobile(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Widgets"),
      body: WidgetsList(),
    );
  }

  Widget buildTablet(BuildContext context) {
    return ListenableProvider<PageController>(
      create: (context) {
        final currentNotifier = context.read<ActiveWidgetNotifier>().explorable;
        return PageController(
            initialPage:
                explorableWidgets.values.toList().indexOf(currentNotifier));
      },
      builder: (_, __) {
        return Scaffold(
          backgroundColor: context.colorScheme.background,
          body: const SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                WidgetsListDrawer(),
                Expanded(
                  child: WidgetEditor(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SelectWidget extends StatelessWidget {
  final Widget toNavigate;
  final String widgetName;

  const SelectWidget({
    super.key,
    required this.widgetName,
    required this.toNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toNavigate),
          );
        },
        child: SizedBox(
          height: 250,
          width: 250,
          child: AnimatedCard(
            child: Center(
              child: Text(
                widgetName,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
