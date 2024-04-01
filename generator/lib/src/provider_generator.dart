import 'package:source_gen/source_gen.dart';

import 'annotation.dart';
import 'utils.dart';

class ProviderGenerator extends GeneratorForAnnotation<WidgetsAnnotation> {
  @override
  generateForAnnotatedElement(
      element, annotation,buildStep) {
    StringBuffer code = StringBuffer();

    String dartTypeToString(e) {
     return e!.toTypeValue()!.getDisplayString(withNullability: false).replaceAll("<dynamic>", "");
    }
    // Access annotation values
    final widgetsMap = annotation.read('widgets').mapValue.map<String, String>((key, value) => MapEntry(dartTypeToString(key), value!.toStringValue()!));
    final widgets = widgetsMap.keys;

    code.writeln("import 'package:flutter/material.dart';");
    code.writeln("import 'package:flutter_quest_architecture/core/explorable_widget.dart';");
    code.writeln("import 'package:flutter_quest_architecture/core/property_provider.dart';");
    code.writeln("import 'package:provider/provider.dart';");
    for(final widget in widgets) {
      code.writeln("import 'package:flutter_quest_architecture/catalog/widget_notifiers/${camelCaseToLowerUnderscore(widget)}.dart';");
    }
    code.writeln("");
    code.writeln("import 'widgets.codes.g.dart';");
    code.writeln("import 'widgets.drawers.g.dart';");
    code.writeln("import 'widgets.previews.g.dart';");
    code.writeln("");
    code.writeln("final explorableWidgets = {");
    for(final widget in widgets) {
      code.writeln("  $widget: ExplorableWidget(");
      code.writeln("    title: \"$widget\",");
      code.writeln("    widget: const ${widget}Preview(),");
      code.writeln("    code: const ${widget}Code(),");
      code.writeln("    drawer: const ${widget}PropertyDrawer(),");
      code.writeln("    propertiesNotifier: ${widget}PropertiesNotifier(),");
      code.writeln("    description: \"${widgetsMap[widget]}\",");
      code.writeln("  ),");
    }
    code.writeln("};");
    code.writeln("");
    code.writeln("List<ChangeNotifierProvider<Object?>> getProviders() {");
    code.writeln("  return [");

    for(final widget in widgets) {
      code.writeln("    ChangeNotifierProvider<${widget}PropertiesNotifier>(");
      code.writeln(
          "      create: (_) => explorableWidgets[$widget]!.propertiesNotifier");
      code.writeln("      as ${widget}PropertiesNotifier,");
      code.writeln("    ),");
    }
    code.writeln("    ChangeNotifierProvider<ActiveWidgetNotifier>(");
    code.writeln("      create: (_) => ActiveWidgetNotifier(");
    code.writeln("        explorableWidgets.values.first,");
    code.writeln("      ),");
    code.writeln("    ),");
    code.writeln("  ];");
    code.writeln("}");
    code.writeln("");

    return code.toString();
  }
}