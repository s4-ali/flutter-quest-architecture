import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

class CodeViewer extends StatelessWidget {
  final String code;
  const CodeViewer(this.code, {super.key, });

  @override
  Widget build(BuildContext context) {
    return DartCodeViewer(
      code,
      classStyle: TextStyle(
        color: context.colorScheme.primary,
      ),
      numberStyle: TextStyle(
        color: context.colorScheme.tertiary,
      ),
      punctuationStyle: TextStyle(
        color: context.colorScheme.onSurface,
      ),
      showCopyButton: false,
    );
  }
}
