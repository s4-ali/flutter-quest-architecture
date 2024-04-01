import 'package:generator/src/annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'utils.dart';

class PreviewsGenerator extends GeneratorForAnnotation<WidgetsAnnotation> {
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
    code.writeln("import 'package:provider/provider.dart';");
    code.writeln("");
    for(final widget in widgets) {
      code.writeln("class ${widget}Preview extends StatelessWidget {");
      code.writeln("  const ${widget}Preview({super.key});");
      code.writeln("");
      code.writeln("  @override");
      code.writeln("  Widget build(BuildContext context) {");
      code.writeln(
          "    return Consumer<${widget}PropertiesNotifier>(builder: (context, props, _) {");
      code.writeln("      return props.buildPreview(context);");
      code.writeln("    });");
      code.writeln("  }");
      code.writeln("}");
    }

    return code.toString();
  }
}