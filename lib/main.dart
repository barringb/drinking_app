import 'package:flutter/material.dart';
import 'package:drinking_app/screens/landing_screen.dart';

void main() {
  runApp(const DrinkingApp());
}

class DrinkingApp extends StatelessWidget {
  const DrinkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingScreen(),
    );
  }
}
