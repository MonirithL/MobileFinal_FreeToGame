import 'package:flutter/material.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeIndex = context.watch<ThemeLogic>().themeIndex;
    final textColor = themeIndex == 0 ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(25), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "About Us",
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold, color: textColor),
                ),
                SizedBox(height: 30), 
                Text(
                  "What is FreeToGame all about?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),
                ),
                SizedBox(height: 5),
                Text(
                  "We built FreeToGame to create an ecosystem that brings "
                  "all the best Free-to-Play Games and MMO Games into one "
                  "place while rewarding gamers with free premium in-game "
                  "loot, special offers, and exclusive perks. Our vision is to "
                  "create the most exciting and rewarding gaming experience "
                  "by breaking the inflexible concept of digital storefronts. "
                  "You get more value... and it's all still completely free.",
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  "More Rewarding",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),
                ),
                Icon(
                  Icons.diamond_sharp,
                  size: 82,
                  color: Color.fromARGB(255, 142, 1, 202),
                ),
                Text(
                  "Score all premium loot for free, unlock rewards and exclusive perks!",
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  "Easy Discovery",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),
                ),
                Icon(
                  Icons.games,
                  size: 75,
                  color: Color.fromARGB(255, 250, 84, 0),
                ),
                Text(
                  "Discover games easily and get introduced to new ones.",
                  style: TextStyle(fontSize: 13, color: textColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Text(
                  "Smart Recommendations",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),
                ),
                Icon(
                  Icons.recommend_outlined,
                  size: 75,
                  color: Color.fromARGB(255, 2, 177, 216),
                ),
                Text(
                  "Get personalized recommendations powered by our own algorithm.",
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
