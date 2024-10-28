import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freetogame/logic/GameModelLogic.dart';
import 'package:freetogame/logic/ThemeLogic.dart';
import 'package:freetogame/model/GameModel.dart';
import 'package:freetogame/screen/DetailScreen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late int themeIndex;
  late TextEditingController _searchController;
  List<GameModel> results = [];
  List<GameModel> original =[];
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    original = context.watch<GameModelLogic>().games;
    themeIndex = context.watch<ThemeLogic>().themeIndex;
    return Scaffold(
        body: Center(
          child: _buildBody(context, themeIndex),
        )
    );
  }

  Widget _buildBody(BuildContext context, int themeIndex){
    String query = context.watch<GameModelLogic>().query;
    _searchController.text = query;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 200,
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value){_search();},
                      // onChanged: (value){
                      //   _search(context);
                      // },
                      style: TextStyle(
                        color: (themeIndex == 1)
                            ? Color.fromARGB(255, 39, 43, 49)
                            : Color.fromARGB(255, 236, 236, 236),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                        hintText: "Search Games Title",
                        hintStyle: TextStyle(
                          color: (themeIndex == 1)
                              ? Color.fromARGB(184, 39, 43, 49)
                              : Color.fromARGB(160, 236, 236, 236),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: (themeIndex==1)?Colors.blueAccent:Colors.white54,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: (themeIndex==1)?Colors.lightBlueAccent:Colors.white,
                                width: 2
                            )
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  //search service
                  // context.read<GameModelLogic>().searchObjects()
                  _search();
                }, icon: Icon(Icons.search_outlined,color: (themeIndex == 1)
                    ? Color.fromARGB(255, 39, 43, 49)
                    : Color.fromARGB(255, 236, 236, 236),))
              ],
            ),
          ),
          Container(child:_buildList(context, themeIndex))
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, int themeIndex){
    List<GameModel> gameSearched = context.watch<GameModelLogic>().searchGames;
    if(gameSearched.isEmpty){
      return Expanded(
        child: Center(
          child: Text("No results, Search Something!",
            style: TextStyle(color: (themeIndex == 1)
                ? Color.fromARGB(180, 39, 43, 49)
                : Color.fromARGB(180, 236, 236, 236),),),
        ),
      );
    }else{
      return Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Result(s): ${gameSearched.length}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: (themeIndex==1)?Color.fromARGB(255, 39, 43, 49):Color.fromARGB(255, 236, 236, 236))
                  ,textAlign: TextAlign.start,),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: gameSearched.length,
                    itemBuilder: (context, index){
                      return Container(
                          padding: EdgeInsets.only(top: 10, bottom: 6, left: 12, right: 10),
                          child: _buildItems(gameSearched[index], context));
                    }
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildItems(GameModel game, BuildContext context){
    return Container(
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
      child: Container(
        decoration: BoxDecoration(
            color: (themeIndex==1)?Color.fromARGB(255, 242, 242, 242):Color.fromARGB(255, 39, 43, 40),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                    child: CachedNetworkImage(imageUrl: game.thumbnail,height: 80,fit: BoxFit.fitHeight,),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(game.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: (themeIndex==1)?Color.fromARGB(255, 39, 43, 49):Color.fromARGB(255, 236, 236, 236)),overflow: TextOverflow.ellipsis, maxLines: 2,),
                          Text(game.genre, style: TextStyle(fontSize:12, fontWeight: FontWeight.w400, color: (themeIndex==1)?Color.fromARGB(255, 39, 43, 49):Color.fromARGB(255, 216, 216, 216),),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              alignment: Alignment.bottomRight,
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
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(
                        color: (themeIndex==1)?Color.fromARGB(255,0, 153, 255):Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 6
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  void _search(){
    String searchText = _searchController.text; // Get the text from the TextField
    if (searchText.isNotEmpty) {
      // Perform your search operation here
      context.read<GameModelLogic>().setQuery(searchText);
      context.read<GameModelLogic>().searchObjects(searchText);
    }
  }


  void _search2(){
    String searchText = _searchController.text; // Get the text from the TextField
    if (searchText.isNotEmpty) {
      // Perform your search operation here
      List<GameModel> gamesFound = original.where((game) {
        return game.title.toLowerCase().contains(searchText.trim().toLowerCase());
      }).toList();
      setState(() {
        results = gamesFound;
        print("Result length: ${results.length}");
      });
    }
  }


}