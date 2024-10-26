import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 45, 51),
      body: Center(
        child: Image.asset("image/gameLogo.png", height: 200, width: 200,),
      ),
    );
  }
}
