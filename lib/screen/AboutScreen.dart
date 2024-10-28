import 'package:flutter/material.dart';
import 'package:freetogame/language/Language.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:provider/provider.dart';

import '../logic/LanguageLogic.dart';

class AboutScreen extends StatelessWidget {
  late int _langIndex;

  @override
  Widget build(BuildContext context) {
    final themeIndex = context.watch<ThemeLogic>().themeIndex;
    final textColor = themeIndex == 0 ? Colors.white : Colors.black;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    Language lang = _langIndex == 0 ? Language() : Khmer();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lang.aboutUs,
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                SizedBox(height: 25),
                Text(
                  lang.groupmember,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  lang.lengmonirith +
                      ", " +
                      lang.limankim +
                      ", " +
                      lang.sarompanha,
                  style: TextStyle(fontSize: 15, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  lang.aboutUs1,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  lang.aboutUs2,
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  lang.rewarding,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                Icon(
                  Icons.diamond_sharp,
                  size: 82,
                  color: Color.fromARGB(255, 142, 1, 202),
                ),
                Text(
                  lang.rewardingContent,
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  lang.discovery,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                Icon(
                  Icons.games,
                  size: 75,
                  color: Color.fromARGB(255, 250, 84, 0),
                ),
                Text(
                  lang.discoveryContent,
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  lang.recom,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
                Icon(
                  Icons.recommend_outlined,
                  size: 75,
                  color: Color.fromARGB(255, 2, 177, 216),
                ),
                Text(
                  lang.recomContent,
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
