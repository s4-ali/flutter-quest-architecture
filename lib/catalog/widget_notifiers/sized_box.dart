import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/core/property_provider.dart';
import 'package:flutter_quest_architecture/property_fields/color_field.dart';
import 'package:flutter_quest_architecture/property_fields/number_field.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

typedef SizedBoxProperties = ({
  double? height,
  double? width,
});

class SizedBoxPropertiesNotifier extends PropertiesNotifier<SizedBoxProperties> {
  @override
  String get code {
    return """
      SizedBox(
        height: ${fieldValues.height},
        width: ${fieldValues.width},
      )
    """;
  }

  @override
  SizedBoxProperties get fieldValues => (
    height: getValueOf('height'),
    width: getValueOf('width')
  );

  @override
  Widget buildPreview(BuildContext context) {
    return SizedBox(
      height: fieldValues.height,
      width: fieldValues.width,
      child: ColoredBox(
        color: context.colorScheme.primary,
      ),
    );
  }

  @override
  void registerFields() {
    heightField(initialValue: 200);
    widthField(initialValue: 150);
  }
}
