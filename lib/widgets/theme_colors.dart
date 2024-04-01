import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/main.dart';
import 'package:flutter_quest_architecture/widgets/color_option.dart';

const themeColors = [
  _ThemeColor(color: Color(0xFFD50000)),
  _ThemeColor(color: Color(0xFFC51162)),
  _ThemeColor(color: Color(0xFFAA00FF)),
  _ThemeColor(color: Color(0xFF6200EA)),
  _ThemeColor(color: Color(0xFF304FFE)),
  _ThemeColor(color: Color(0xFF2962FF)),
  _ThemeColor(color: Color(0xFF0091EA)),
  _ThemeColor(color: Color(0xFF00B8D4)),
  _ThemeColor(color: Color(0xFF00BFA5)),
  _ThemeColor(color: Color(0xFF00C853)),
  _ThemeColor(color: Color(0xFF64DD17)),
  _ThemeColor(color: Color(0xFFAEEA00)),
  _ThemeColor(color: Color(0xFFFFD600)),
  _ThemeColor(color: Color(0xFFFFAB00)),
  _ThemeColor(color: Color(0xFFFF6D00)),
  _ThemeColor(color: Color(0xFFDD2C00)),
];

class ThemeColors extends StatelessWidget {
  const ThemeColors({super.key});

  @override
  Widget build(BuildContext context) {

    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: themeColors,
    );
  }
}

class _ThemeColor extends StatelessWidget {
  final Color color;

  const _ThemeColor({required this.color});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: themeColorNotifier,
      builder: (_, selectedColor, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: ColorOptionCircle(
            fillColor: color,
            isSelected: selectedColor == color,
            onUpdated: (_) {
              themeColorNotifier.value = color;
            },
          ),
        );
      },
    );
  }
}
