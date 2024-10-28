import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freetogame/language/Language.dart';
import 'package:freetogame/logic/BottomNavLogic.dart';
import 'package:freetogame/logic/LanguageLogic.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:freetogame/screen/AboutScreen.dart';
import 'package:freetogame/screen/BrowseScreen.dart';
import 'package:freetogame/screen/SearchScreen.dart';
import 'package:freetogame/screen/SearchScreen.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  Language _lang = Khmer();
  int _themeIndex = 0;
  int _langIndex = 1;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [BrowseScreen(), SearchScreen(), AboutScreen()];
    int currentIndex = context.watch<BottomNavLogic>().currentIndex;
    _themeIndex = context.watch<ThemeLogic>().themeIndex;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    Language lang = _langIndex == 0 ? Language() : Khmer();
    return Scaffold(
      appBar: AppBar(
        title: Container(
          // alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 10),
          child: Image.asset("image/logo_S.png")
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                context.read<LanguageLogic>().toggle();
              },
              icon: Icon(Icons.text_fields_outlined)),
          IconButton(
              onPressed: () {
                context.read<ThemeLogic>().toggle();
              },
              icon: Icon(_themeIndex == 1 ? Icons.light_mode : Icons.dark_mode),)
              // icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: lang.browse, 
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: lang.search, 
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: lang.aboutus, 
            icon: Icon(Icons.info),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int newIndex) =>
            {context.read<BottomNavLogic>().goIndex(newIndex)},
      ),
    );
  }
}
