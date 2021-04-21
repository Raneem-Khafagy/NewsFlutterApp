import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Dark{
  static var darkIcon = CupertinoIcons.moon_fill;
  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    secondaryHeaderColor: Colors.grey[400],
    shadowColor: Colors.grey[800],
  );
}