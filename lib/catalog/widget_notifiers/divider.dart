import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/property_fields/color_field.dart';
import 'package:flutter_quest_architecture/property_fields/number_field.dart';

typedef DividerProperties = ({
  double? height,
  double? thickness,
  double? indent,
  double? endIndent,
  Color? color,
});

class DividerPropertiesNotifier extends PropertiesNotifier<DividerProperties> {

  @override
  DividerProperties get fieldValues {
    return (
      height: getValueOf("height"),
      thickness: getValueOf("thickness"),
      indent: getValueOf("indent"),
      endIndent: getValueOf("endIndent"),
      color: getValueOf("color"),
    );
  }

  @override
  Widget buildPreview(BuildContext context) {
    return Divider(
      height: fieldValues.height,
      thickness: fieldValues.thickness,
      indent: fieldValues.indent,
      endIndent: fieldValues.endIndent,
      color: fieldValues.color,
    );
  }

  @override
  String get code {
    return """
        Divider(
          height: ${fieldValues.height},
          thickness: ${fieldValues.thickness},
          indent: ${fieldValues.indent},
          endIndent: ${fieldValues.endIndent},
          color: ${fieldValues.color},
        )""";
  }

  @override
  void registerFields() {
    heightField(isOptional: false);
    doubleField(
      id: "thickness",
      title: "Thickness",
      initialValue: 5,
    );
    doubleField(
      id: "indent",
      title: "Indent",
      initialValue: 10,
    );
    doubleField(
      id: "endIndent",
      title: "End Indent",
      initialValue: 10,
    );
    colorField(
      id: "color",
      title: 'Color',
      initialValue: Colors.blue,
    );
  }
}
