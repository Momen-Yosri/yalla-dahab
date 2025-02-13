import 'package:flutter/material.dart';

class AppConfigurationProvider extends ChangeNotifier{
   ThemeMode currentThemeMode = ThemeMode.light;
  void swapThemeMode(){
    if  (currentThemeMode ==  ThemeMode.light) {
      currentThemeMode = ThemeMode.dark;
      print("dark theme mode");
    } else {
      currentThemeMode = ThemeMode.light;
            print("light theme mode");
    }
    notifyListeners();
    return;
  } 
}