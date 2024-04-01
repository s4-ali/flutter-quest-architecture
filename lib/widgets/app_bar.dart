import 'package:flutter/material.dart';
import 'package:flutter_quest_architecture/utils/extensions.dart';
import 'package:flutter_quest_architecture/widgets/switch_theme_icon_button.dart';
import 'package:flutter_quest_architecture/widgets/theme_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = context.deviceScreenType;
    return AppBar(
      title: Text(title),
      centerTitle: deviceType.isDesktop,
      elevation: 2,
      actions: [
        if (!deviceType.isMobile) const ThemeColors(),
        const SwitchThemeIconButton(),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
