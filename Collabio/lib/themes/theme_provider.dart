import 'package:flutter/material.dart';
import 'package:frontend/themes/themes.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = MyThemes.darkTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == MyThemes.lightTheme) {
      themeData = MyThemes.darkTheme;
    } else {
      themeData = MyThemes.lightTheme;
    }
  }
}
