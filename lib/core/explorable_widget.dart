import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';

class ExplorableWidget {
  final Widget widget;
  final Widget code;
  final Widget drawer;
  final String title;
  final String description;
  final PropertiesNotifier propertiesNotifier;

  const ExplorableWidget({
    required this.widget,
    required this.title,
    required this.code,
    required this.propertiesNotifier,
    required this.drawer,
    required this.description,
  });
}
