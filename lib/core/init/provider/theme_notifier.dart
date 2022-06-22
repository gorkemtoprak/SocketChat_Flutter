import '../../enums/app_theme_enums.dart';
import '../theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance!.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeTheme(AppThemes theme) {
    if (theme == AppThemes.light) {
      _currentTheme = AppThemeLight.instance!.theme;
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
