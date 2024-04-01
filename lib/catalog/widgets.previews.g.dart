// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PreviewsGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/divider.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/sized_box.dart';
import 'package:provider/provider.dart';

class DividerPreview extends StatelessWidget {
  const DividerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DividerPropertiesNotifier>(builder: (context, props, _) {
      return props.buildPreview(context);
    });
  }
}

class SizedBoxPreview extends StatelessWidget {
  const SizedBoxPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SizedBoxPropertiesNotifier>(builder: (context, props, _) {
      return props.buildPreview(context);
    });
  }
}
