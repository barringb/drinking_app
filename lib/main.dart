import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drinking_app/screens/landing_screen.dart';

void main() {
  runApp(const DrinkingApp());
}

class DrinkingApp extends StatelessWidget {
  const DrinkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData.light().copyWith(backgroundColor: Colors.black),
      home: LandingScreen(),
    );
  }
}
