// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CodesGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/divider.dart';
import 'package:flutter_quest_architecture/catalog/widget_notifiers/sized_box.dart';
import 'package:flutter_quest_architecture/widgets/code_viewer.dart';
import 'package:provider/provider.dart';

class DividerCode extends StatelessWidget {
  const DividerCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DividerPropertiesNotifier>(builder: (_, props, __) {
      return CodeViewer(
        props.code,
      );
    });
  }
}

class SizedBoxCode extends StatelessWidget {
  const SizedBoxCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SizedBoxPropertiesNotifier>(builder: (_, props, __) {
      return CodeViewer(
        props.code,
      );
    });
  }
}
