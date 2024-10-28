import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailscreen extends StatelessWidget {
  GameModel game;
  late int themeIndex;

  Detailscreen({required this.game});

  @override
  Widget build(BuildContext context) {
    themeIndex = context.watch<ThemeLogic>().themeIndex;
    List<GameModel> games = context.watch<GameModelLogic>().games;
    return Scaffold(
      appBar: AppBar(
          title: Text(game.title, style: TextStyle(color: Colors.white))),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    String releasedDate = DateFormat('yyyy-MM-dd').format(game.releaseDate);
    return Container(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  game.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: (themeIndex == 1)
                        ? Color.fromARGB(255, 39, 43, 49)
                        : Color.fromARGB(255, 236, 236, 236),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "by " + game.developer,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: (themeIndex == 1)
                      ? Color.fromARGB(255, 175, 175, 175)
                      : Color.fromARGB(255, 236, 236, 236),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(game.thumbnail,
                        maxHeight: 200),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(5),
              )),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genre",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: (themeIndex == 1)
                            ? Color.fromARGB(255, 96, 96, 96)
                            : Color.fromARGB(255, 236, 236, 236),
                      ),
                    ), // Label
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        game.genre,
                        style: TextStyle(
                          color: (themeIndex == 1)
                              ? Color.fromARGB(255, 96, 96, 96)
                              : Color.fromARGB(255, 236, 236, 236),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Platforms",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: (themeIndex == 1)
                            ? Color.fromARGB(255, 96, 96, 96)
                            : Color.fromARGB(255, 236, 236, 236),
                      ),
                    ), // Label
                    SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        game.platform,
                        style: TextStyle(
                          color: (themeIndex == 1)
                              ? Color.fromARGB(255, 96, 96, 96)
                              : Color.fromARGB(255, 236, 236, 236),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: (themeIndex == 1)
                    ? Color.fromARGB(255, 96, 96, 96)
                    : Color.fromARGB(255, 236, 236, 236),
              ),
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  game.shortDescription,
                  style: TextStyle(
                    color: (themeIndex == 1)
                        ? Color.fromARGB(255, 96, 96, 96)
                        : Color.fromARGB(255, 236, 236, 236),
                  ),
                  maxLines:
                      3, // Optional: Set a maximum number of lines if needed
                  overflow: TextOverflow
                      .ellipsis, // Optional: To indicate there is more text
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Publisher",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: (themeIndex == 1)
                    ? Color.fromARGB(255, 96, 96, 96)
                    : Color.fromARGB(255, 236, 236, 236),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                game.publisher,
                style: TextStyle(
                  color: (themeIndex == 1)
                      ? Color.fromARGB(255, 96, 96, 96)
                      : Color.fromARGB(255, 236, 236, 236),
                ),
              ),
            ),
          ]),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Released Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: (themeIndex == 1)
                    ? Color.fromARGB(255, 96, 96, 96)
                    : Color.fromARGB(255, 236, 236, 236),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                releasedDate,
                style: TextStyle(
                  color: (themeIndex == 1)
                      ? Color.fromARGB(255, 96, 96, 96)
                      : Color.fromARGB(255, 236, 236, 236),
                ),
              ),
            ),
          ]),
          Center(
            child: TextButton(
              child: Text("Go to game"),
              onPressed: (){
                openLink(game.gameUrl);
              },
            ),
          )
        ]));
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
