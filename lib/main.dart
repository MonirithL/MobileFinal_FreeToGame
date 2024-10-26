import 'package:flutter/material.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/screen/BottomNav.dart';
import 'package:freetogame/screen/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppWithProviders());
}

Widget AppWithProviders() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> GameModelLogic())
    ],
    child: SplashScreen(),
  );
}

class FreeToGameApp extends StatelessWidget {
  const FreeToGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BottomNav(),
        theme: ThemeData(
          primaryColorDark: Color.fromARGB(255, 22, 19, 40),
        ));
  }
}
