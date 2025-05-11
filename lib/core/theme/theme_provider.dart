import 'package:flutter/material.dart';
import 'package:weather/core/theme/dark_mode.dart';
import 'package:weather/core/theme/light_mode.dart';

final class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  void toogleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;

      return;
    }

    themeData = lightMode;
  }
}
