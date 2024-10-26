import 'package:flutter/material.dart';
import 'package:freetogame/GameColor.dart';
import 'package:freetogame/screen/AboutScreen.dart';
import 'package:freetogame/screen/BrowseScreen.dart';
import 'package:freetogame/screen/SearchScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _current_index = 0;
  List<Widget> _screens = [BrowseScreen(), SearchScreen(), AboutScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _screens[_current_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: GameColor.themeDarkColor,
        items: const [
          BottomNavigationBarItem(
            label: 'Browse',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'About Us', icon: Icon(Icons.info)),
        ],
        currentIndex: _current_index,
        onTap: (int newIndex) => {
          setState(() {
            _current_index = newIndex;
          })
        },
      ),
    );
  }

  AppBar _buildAppbar(BuildContext con) {
    return AppBar(
      backgroundColor: Theme.of(con).primaryColorDark,
      title: Container(
        padding: EdgeInsets.only(bottom: 10),
          child: Image.network("https://www.freetogame.com/assets/images/freetogame-logo.png",
      fit: BoxFit.fitHeight),
      ),
      centerTitle: false,
    );
  }
}
