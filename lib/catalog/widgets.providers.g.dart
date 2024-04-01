// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ProviderGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/core/explorable_widget.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/divider.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/sized_box.dart';

import 'widgets.codes.g.dart';
import 'widgets.drawers.g.dart';
import 'widgets.previews.g.dart';

final explorableWidgets = {
  Divider: ExplorableWidget(
    title: "Divider",
    widget: const DividerPreview(),
    code: const DividerCode(),
    drawer: const DividerPropertyDrawer(),
    propertiesNotifier: DividerPropertiesNotifier(),
    description: "A thin horizontal line, with padding on either side.",
  ),
  SizedBox: ExplorableWidget(
    title: "SizedBox",
    widget: const SizedBoxPreview(),
    code: const SizedBoxCode(),
    drawer: const SizedBoxPropertyDrawer(),
    propertiesNotifier: SizedBoxPropertiesNotifier(),
    description:
        "If given a child, this widget forces it to have a specific width and/or height. These values will be ignored if this widget's parent does not permit them.",
  ),
};

List<ChangeNotifierProvider<Object?>> getProviders() {
  return [
    ChangeNotifierProvider<DividerPropertiesNotifier>(
      create: (_) => explorableWidgets[Divider]!.propertiesNotifier
          as DividerPropertiesNotifier,
    ),
    ChangeNotifierProvider<SizedBoxPropertiesNotifier>(
      create: (_) => explorableWidgets[SizedBox]!.propertiesNotifier
          as SizedBoxPropertiesNotifier,
    ),
    ChangeNotifierProvider<ActiveWidgetNotifier>(
      create: (_) => ActiveWidgetNotifier(
        explorableWidgets.values.first,
      ),
    ),
  ];
}
