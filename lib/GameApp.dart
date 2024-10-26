import 'package:flutter/material.dart';
import 'package:freetogame/logic/BottomNavLogic.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/logic/LanguageLogic.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:freetogame/screen/AboutScreen.dart';
import 'package:freetogame/screen/BottomNav.dart';
import 'package:freetogame/screen/BrowseScreen.dart';
import 'package:freetogame/screen/SearchScreen.dart';
import 'package:provider/provider.dart';

Widget gameAppWithProviders() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GameModelLogic()),
      ChangeNotifierProvider(create: (context) => BottomNavLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
      ChangeNotifierProvider(create: (context) => LanguageLogic())
    ],
    child: SplashScreen(),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future _readAll(BuildContext context) async {
    context.read<GameModelLogic>().read();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _readAll(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GameApp();
          } else {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "image/gameLogo.png",
                      height: 200,
                      width: 200,
                    ),
                    CircularProgressIndicator(),
                  ],
                )),
              ),
            );
          }
        });
  }
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeIndex = context.watch<ThemeLogic>().themeIndex;

    return MaterialApp(
      home: BottomNav(),
      themeMode: themeIndex == 0 ? ThemeMode.dark : ThemeMode.light,
      darkTheme: _darkTheme(),
      theme: _lightTheme(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 47, 36, 77),
        foregroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: const Color.fromARGB(244, 20, 20, 20),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

// int _currentIndex = context.watch<BottomNavLogic>().currentIndex;
// List<Widget> _screens = [BrowseScreen(), SearchScreen(), AboutScreen()];
