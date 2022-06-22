import 'package:flutter/material.dart';

import 'light/light_theme_interface.dart';

class AppThemeLight with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        primaryColor: colorSchema!.mainColor,
        colorScheme: const ColorScheme.light().copyWith(
          primary: colorSchema!.mainColor,
          onPrimary: colorSchema!.greyish,
          secondary: colorSchema!.secondaryElement,
          onSecondary: colorSchema!.white,
        ),
      );
}
