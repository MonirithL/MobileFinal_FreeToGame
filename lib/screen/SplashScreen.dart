import 'package:flutter/material.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/main.dart';
import 'package:provider/provider.dart';

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
          // Data is loaded, return the main app
          return FreeToGameApp();
        } else {
          // While loading, show a loading spinner
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Theme.of(context).primaryColorDark,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('image/gameLogo.png', height: 200, width: 200),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

    // return Scaffold(
    //   backgroundColor: Theme.of(context).primaryColorDark,
    //   body: Center(
    //     child: Image.asset('image/gameLogo.png', height: 200, width:200),
    //   ),
    // );;
  }
