import 'package:flutter/material.dart';
import '../../views/screens/home.dart';
import '../../constants/assest_path.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
  
  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomeScreen()
      )
    ); 
  }
  
  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(image: AssetImage(Assetpath.logo),
       width: MediaQuery.of(context).size.width * 0.6,
       ),
      
    ),
    );
  }
}
  
