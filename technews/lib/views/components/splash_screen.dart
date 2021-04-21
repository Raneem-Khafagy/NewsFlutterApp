import 'package:flutter/material.dart';
import 'package:technews/constants/assest_path.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage(Assetpath.logo),
       width: MediaQuery.of(context).size.width * 0.6,
       ),
      
    ),
    );
  }
}