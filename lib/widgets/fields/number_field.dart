import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/core/property.dart';
import 'package:flutter_quest_architecture/widgets/core/property_previewer.dart';

import '../text_field.dart';

class NumberField extends PropertyWidget<num> {
  const NumberField(
      {super.key, required super.onChanged, required super.value});

  @override
  Widget build(BuildContext context) {
    return _NumberField(
      key: key,
      onChanged: onChanged,
      value: value,
    );
  }
}

class _NumberField extends StatefulWidget {
  final void Function(num) onChanged;
  final num value;

  const _NumberField({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  State<_NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<_NumberField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: "${widget.value.isInfinite ? "Infinite" : widget.value}",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      key: const ValueKey("NumberField"),
      onChanged: (text) {
        final number = num.tryParse(text);
        if (number != null) {
          widget.onChanged(number);
        }
      },
      suffixIcon: IconButton(
        onPressed: () {
          controller.text = "Infinite";
          widget.onChanged(double.infinity);
        },
        icon: Icon(
          Icons.all_inclusive,
          size: 24,
          color: widget.value.isInfinite ? context.colorScheme.primary : null,
        ),
      ),
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }
}

class NumberFieldPreviewer extends StatelessWidget {
  const NumberFieldPreviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return PropertyPreviewer<num>(
      title: "Number",
      values: const [56, 89, 456, 2, 754],
      propertyBuilder: (onChanged, value) {
        return NumberField(
          onChanged: onChanged,
          value: value,
        );
      },
    );
  }
}
