import 'package:flutter/material.dart';

class AppconfigProvider extends ChangeNotifier {
  String AppLanguage = 'en';
  ThemeMode Apptheme = ThemeMode.light;

  bool isDark() {
    return Apptheme == ThemeMode.dark;
  }

  void changeLanguage(String Langcode) {
    if (Langcode == AppLanguage) {
      return;
    }
    AppLanguage = Langcode;
    notifyListeners();
  }

  void changeTheme(ThemeMode newmode) {
    if (newmode == Apptheme) {
      return;
    }
    Apptheme = newmode;
    notifyListeners();
  }
}
