import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/widgets/color_option.dart';
import 'package:flutter_quest_architecture/widgets/core/property.dart';
import 'package:flutter_quest_architecture/widgets/core/property_previewer.dart';
import 'package:flutter_quest_architecture/widgets/text_field.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

List<Color> _commonColorList = [
  const Color(0xFFF44236),
  const Color(0xFFE91E63),
  const Color(0xFF9C27B0),
  const Color(0xFF6739B7),
  const Color(0xFF3F51B5),
  const Color(0xFF2396F3),
  const Color(0xFF04A9F4),
  const Color(0xFF00BCD4),
  const Color(0xFF039588),
  const Color(0xFF4CAE50),
  const Color(0xFF8BC34A),
  const Color(0xFFCCDC39),
  const Color(0xFFFFEB3B),
  const Color(0xFFFFC107),
  const Color(0xFFFE9700),
  const Color(0xFFFF5622),
  const Color(0xFF795548),
  const Color(0xFF617C8B),
  const Color(0xFF617C8B),
  const Color(0xFF9E9E9E),
];

class ColorField extends PropertyWidget<Color> {
  const ColorField({
    super.key,
    required super.value,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _ColorField(onChanged: onChanged, value: value);
  }
}

class _ColorField extends StatefulWidget {
  final void Function(Color) onChanged;
  final Color value;

  const _ColorField({
    required this.onChanged,
    required this.value,
  });

  @override
  State<_ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends State<_ColorField> {
  late TextEditingController opacityTextEditingController;

  @override
  void initState() {
    opacityTextEditingController =
        TextEditingController(text: "${(widget.value.opacity * 100).toInt()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textFieldValue = widget.value.hex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildColorBox(context),
            buildColorTextField(textFieldValue),
            const SizedBox(
              width: 8,
            ),
            buildOpacityTextField(),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 7),
          child: Text("Common Colors"),
        ),
        SizedBox(
          width: double.maxFinite,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
              _commonColorList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: ColorOptionBox(
                  fillColor: _commonColorList[index],
                  isSelected: _commonColorList[index] == widget.value,
                  onUpdated: widget.onChanged,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildOpacityTextField() {
    return SizedBox(
      width: 85,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: AppTextField(
          label: "Opacity",
          controller: opacityTextEditingController,
          suffix: const Text("%"),
          maxLength: 3,
          onChanged: (value) {
            try {
              final intValue = int.parse(value);
              if (intValue > 100) {
                opacityTextEditingController.text = "100";
                return;
              }
              widget.onChanged(widget.value.withOpacity(intValue / 100));
            } catch (e) {
              opacityTextEditingController.text = "100";
            }
          },
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Expanded buildColorTextField(String textFieldValue) {
    return Expanded(
      child: AppTextField(
        label: "Color",
        maxLength: 6,
        controller: TextEditingController(text: textFieldValue),
        onChanged: (value) {
          if (value.length != 6) return;
          final color = Color(
              int.parse("0x${widget.value.hexAlpha.substring(0, 2)}$value"));
          widget.onChanged(
            color,
          );
        },
      ),
    );
  }

  Padding buildColorBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ColorOptionBox(
        fillColor: widget.value,
        onUpdated: (color) => _showColorPickerDialog(context, color),
      ),
    );
  }

  void _showColorPickerDialog(BuildContext context, Color color) async {
    final newColor = await showColorPickerDialog(
      context,
      color,
      pickersEnabled: {
        ColorPickerType.wheel: true,
        ColorPickerType.accent: false,
        ColorPickerType.primary: false,
      },
      title: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          "Pick Color",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      enableShadesSelection: false,
      padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16, top: 16),
      actionButtons: const ColorPickerActionButtons(
        okButton: true,
        closeButton: true,
        dialogActionButtons: false,
        dialogActionIcons: true,
      ),
      backgroundColor: const Color(0xFF000000),
    );
    widget.onChanged(newColor);
  }
}

class ColorPreviewer extends StatelessWidget {
  const ColorPreviewer({super.key});

  @override
  Widget build(BuildContext context) {
    return PropertyPreviewer<Color>(
      title: "Color",
      values: const [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.blue,
      ],
      propertyBuilder: (onChanged, value) {
        return ColorField(
          onChanged: onChanged,
          value: value,
        );
      },
    );
  }
}
