import 'package:flutter/material.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatelessWidget {
  late int themeindex;

  @override
  Widget build(BuildContext context) {
    themeindex = context.watch<ThemeLogic>().themeIndex;
    return Scaffold(
      body: Center(
        child: _buildBody(context),
      )
    );
  }
  Widget _buildBody(BuildContext coontext){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 200,
                  child: TextField(decoration: InputDecoration(hintText: "Search Games Title",)),),
              ),
              IconButton(onPressed: (){
                //search service
                openLink('https://www.google.com');
              }, icon: Icon(Icons.search_outlined))
            ],
          )
        ],
      ),
    );
  }

  void openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("Could not launch $url");
    }
  }



}