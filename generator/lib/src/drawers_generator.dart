import 'package:source_gen/source_gen.dart';

import 'annotation.dart';
import 'utils.dart';

class DrawersGenerator extends GeneratorForAnnotation<WidgetsAnnotation> {
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
    code.writeln("import 'package:flutter_quest_architecture/widgets/core/properties_drawer.dart';");
    code.writeln("import 'package:provider/provider.dart';");
    for(final widget in widgets) {
      code.writeln("");
      code.writeln("class ${widget}PropertyDrawer extends StatelessWidget {");
      code.writeln("  const ${widget}PropertyDrawer({super.key});");
      code.writeln("");
      code.writeln("  @override");
      code.writeln("  Widget build(BuildContext context) {");
      code.writeln(
          "    return Consumer<${widget}PropertiesNotifier>(builder: (_, notifier, __) {");
      code.writeln("      final properties = notifier.properties");
      code.writeln("          .map((e) => e.widget)");
      code.writeln("          .toList();");
      code.writeln("");
      code.writeln("      return PropertiesDrawer(");
      code.writeln("        title: \"$widget\",");
      code.writeln("        properties: properties,");
      code.writeln("      );");
      code.writeln("    });");
      code.writeln("  }");
      code.writeln("}");
    }
    /*

      return PropertiesDrawer(
        title: "Divider",
        properties: properties,
      );
    });
  }
}

* */
    return code.toString();
  }
}