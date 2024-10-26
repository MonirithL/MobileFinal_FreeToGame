import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:provider/provider.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<GameModel> games = context.watch<GameModelLogic>().games;
    print("ayo this is list: ${games.length}");
    return Scaffold(
      body: Center(
          child: ListView.builder(
            itemCount: games.length,
              itemBuilder: (context, index){
              return Column(
                children: [
                  Text(games[index].title),
                ],
              );
              }
          ),
      ),
    );
  }
}