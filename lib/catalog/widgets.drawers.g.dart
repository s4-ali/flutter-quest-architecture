// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DrawersGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/divider.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/sized_box.dart';
import 'package:flutter_quest_architecture/widgets/core/properties_drawer.dart';
import 'package:provider/provider.dart';

class DividerPropertyDrawer extends StatelessWidget {
  const DividerPropertyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DividerPropertiesNotifier>(builder: (_, notifier, __) {
      final properties = notifier.properties.map((e) => e.widget).toList();

      return PropertiesDrawer(
        title: "Divider",
        properties: properties,
      );
    });
  }
}

class SizedBoxPropertyDrawer extends StatelessWidget {
  const SizedBoxPropertyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SizedBoxPropertiesNotifier>(builder: (_, notifier, __) {
      final properties = notifier.properties.map((e) => e.widget).toList();

      return PropertiesDrawer(
        title: "SizedBox",
        properties: properties,
      );
    });
  }
}
