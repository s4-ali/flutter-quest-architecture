import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';

import 'expandable_menu.dart';
import 'switch_theme_icon_button.dart';
import 'theme_colors.dart';
import 'title_container.dart';

class TitleContainerWithTheme extends StatelessWidget {
  final String title;

  const TitleContainerWithTheme({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TitleContainer(title: title),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
            child: ExpandableMenu(
              backgroundColor: context.colorScheme.surface,
              iconColor: context.colorScheme.onSurface,
              itemContainerColor: Colors.transparent,
              height: 52,
              width: 52,
              items: const [
                SwitchThemeIconButton(),
                ...themeColors,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
