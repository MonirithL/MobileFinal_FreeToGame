import 'package:flutter/material.dart';
import 'package:freetogame/logic/BottomNavLogic.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/screen/AboutScreen.dart';
import 'package:freetogame/screen/BottomNav.dart';
import 'package:freetogame/screen/BrowseScreen.dart';
import 'package:freetogame/screen/SearchScreen.dart';
import 'package:provider/provider.dart';


Widget gameAppWithProviders(){
  return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> GameModelLogic()),
        ChangeNotifierProvider(create: (context)=> BottomNavLogic())
      ],
    child: SplashScreen(),
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future _readAll(BuildContext context) async{
    context.read<GameModelLogic>().read();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _readAll(context),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return GameApp();
          }else{
            return MaterialApp(home: Scaffold(
              body: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("image/gameLogo.png", height: 200, width: 200,),
                  CircularProgressIndicator(),
                ],
              )),
            ),);
          }
        }
    );
  }
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: BottomNav(),
    );
  }
}
// int _currentIndex = context.watch<BottomNavLogic>().currentIndex;
// List<Widget> _screens = [BrowseScreen(), SearchScreen(), AboutScreen()];
