import 'package:flutter/material.dart';
import 'package:technews/utils/themes/theme_config.dart';
import 'package:technews/views/components/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:technews/views/components/theme_icon.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);  
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        } else {
          // Loading is done, return the app:
          return Scaffold(body: Center(child: ThemeIcon(themeNotifier: themeNotifier),)
          );
        }
      },
    );
  }
}
