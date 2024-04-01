import 'package:source_gen/source_gen.dart';

import 'annotation.dart';
import 'utils.dart';

class CodesGenerator extends GeneratorForAnnotation<WidgetsAnnotation> {
  @override
  generateForAnnotatedElement(
      element, annotation,buildStep) {
    StringBuffer code = StringBuffer();

    // Access annotation values
    final widgets = annotation.read('widgets').mapValue.keys.toList().map((e) => e!.toTypeValue()!.getDisplayString(withNullability: false).replaceAll("<dynamic>", ""));

    code.writeln("import 'package:flutter/material.dart';");
    for(final widget in widgets) {
      code.writeln(
          "import 'package:flutter_quest_architecture/catalog/widget_notifiers/${camelCaseToLowerUnderscore(widget)}.dart';");
    }
    code.writeln("import 'package:flutter_quest_architecture/widgets/code_viewer.dart';");
    code.writeln("import 'package:provider/provider.dart';");
    code.writeln("");
    for(final widget in widgets) {
      code.writeln("class ${widget}Code extends StatelessWidget {");
      code.writeln("  const ${widget}Code({super.key});");
      code.writeln("");
      code.writeln("  @override");
      code.writeln("  Widget build(BuildContext context) {");
      code.writeln(
          "    return Consumer<${widget}PropertiesNotifier>(builder: (_, props, __) {");
      code.writeln("      return CodeViewer(");
      code.writeln("        props.code,");
      code.writeln("      );");
      code.writeln("    });");
      code.writeln("  }");
      code.writeln("}");
    }

    return code.toString();
  }
}