import 'package:flutter/material.dart';
import 'package:freetogame/screen/SplashScreen.dart';

void main() {
  runApp(const FreeToGameApp());
}

class FreeToGameApp extends StatelessWidget {
  const FreeToGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
    );
  }
}


