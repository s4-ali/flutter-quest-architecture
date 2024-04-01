import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension ColorExtension on Color {
  bool isThe(Color color) {
    return this == color;
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  DeviceScreenType get deviceScreenType => getDeviceType(MediaQuery.of(this).size);
}

extension SwitchThemeExtension on ValueNotifier<ThemeMode> {
  void setLightTheme() {
    value = ThemeMode.light;
  }

  void setDarkTheme() {
    value = ThemeMode.dark;
  }

  void switchTheme() {
    value = isDark ? ThemeMode.light : ThemeMode.dark;
  }

  bool get isLight => value == ThemeMode.light;

  bool get isDark => value == ThemeMode.dark;
}

extension DeviceTypeExtension on DeviceScreenType {
  bool get isMobile => this == DeviceScreenType.mobile;

  bool get isTablet => this == DeviceScreenType.tablet;

  bool get isDesktop => this == DeviceScreenType.desktop;

  bool get isWatch => this == DeviceScreenType.watch;
}
