import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:freetogame/screen/DetailScreen.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class BrowseScreen extends StatelessWidget {
  late int themeIndex;

  @override
  Widget build(BuildContext context) {
    themeIndex = context.watch<ThemeLogic>().themeIndex;
    List<GameModel> games = context.watch<GameModelLogic>().games;
    return Scaffold(
      body: Center(
          child: _buildListView(games, context)
      ),
    );


  }
  Widget _buildListView(List<GameModel> games, BuildContext context){
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index){
          return _buildCard(games[index], context);
        },
        padding: EdgeInsets.only(top: 6, bottom: 6),
      ),
      onRefresh: () async{
        context.read<GameModelLogic>().read();
      },
    );
  }

  Widget _buildCard(GameModel game, BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        child: Container(
          child: _buildContent(game, context),
          decoration: BoxDecoration(
            boxShadow: 
              // Mimicking background gradient with diagonal shadow effect
              (themeIndex==1)?
              [
                BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 3),
                blurRadius: 5,
              )
              ]
                  :
              [
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(3, 3),
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(-1, 3),
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: Colors.yellow,
                  offset: Offset(-3, -1),
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: Colors.green,
                  offset: Offset(1, -3),
                  blurRadius: 5,
                ),
              ],
            borderRadius: BorderRadius.circular(4),
          ),
        )
    );
  }

  Widget _buildContent(GameModel game, BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: (themeIndex==1)?Color.fromARGB(255, 242, 242, 242):Color.fromARGB(255, 39, 43, 40),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(game.thumbnail, maxHeight: 200),
                  fit: BoxFit.fitWidth
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: Text(
                  game.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: (themeIndex==1)?Color.fromARGB(255, 39, 43, 49):Color.fromARGB(255, 236, 236, 236),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),),
                Container(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    game.genre,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: (themeIndex==1)?Color.fromARGB(255, 39, 43, 49):Color.fromARGB(255, 216, 216, 216),
                    )),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(game.shortDescription,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: (themeIndex==1)?Color.fromARGB(255, 112, 112, 112):Color.fromARGB(255, 170, 170, 170),
              )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, bottom: 6, right: 16),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailscreen(game:game)));
                  },
                  child: Text("See more",
                  style: (themeIndex==1)?TextStyle(fontWeight: FontWeight.w500, color: Color.fromARGB(255,39, 43, 59),):
                  TextStyle(fontWeight: FontWeight.w500, color: Color.fromARGB(255,242, 242, 242),)
                    ,),
                  style: TextButton.styleFrom(
                      backgroundColor: (themeIndex==1)?Colors.transparent:Color.fromARGB(255,0, 153, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: (themeIndex==1)?Color.fromARGB(255,0, 153, 255):Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 24
                      )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}