import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Light {
  static
  var lightIcon = CupertinoIcons.sun_max;
  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.grey[350],
      secondaryHeaderColor: Colors.grey[400],
      shadowColor: Colors.black38,
  );
}