import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class ThemeNotifier with ChangeNotifier {
  //Defult theme is light
  bool toggleTheme = true;
  var darkIcon = Dark.darkIcon;
  ThemeData themeData = Light.lightTheme;
  var lightIcon = Light.lightIcon;
  var iconTheme = Dark.darkIcon;
  final darkTheme = Dark.darkTheme;
  final lightTheme = Light.lightTheme;
  

  setTheme(bool changeTheme) {
    if (changeTheme == true) {
      themeData = lightTheme;
      iconTheme = darkIcon;
      toggleTheme = true;
    } else {
      themeData = darkTheme;
      iconTheme = lightIcon;
      toggleTheme = false;
    }
    notifyListeners();
  }
}
