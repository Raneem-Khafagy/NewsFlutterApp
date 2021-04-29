import 'package:flutter/material.dart';
import '/../utils/themes/theme_config.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({
    Key ? key,
    required this.themeNotifier,
  }): super(key: key);

  final ThemeNotifier themeNotifier;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(themeNotifier.iconTheme),
      onPressed: () {
        themeNotifier.toggleTheme = !(themeNotifier.toggleTheme);
        themeNotifier.setTheme(themeNotifier.toggleTheme);
      },
    );
  }
}