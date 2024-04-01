import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/main.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

class SwitchThemeIconButton extends StatelessWidget {
  const SwitchThemeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (BuildContext context, ThemeMode value, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: themeNotifier.switchTheme,
            icon: Icon(
              themeNotifier.isDark ? Icons.light_mode : Icons.dark_mode,
              color: context.colorScheme.onPrimaryContainer,
            ),
          ),
        );
      },
    );
  }
}
