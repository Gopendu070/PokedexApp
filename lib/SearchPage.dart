import 'package:flutter/material.dart';
import 'package:pokedex/Grid.dart';

class SearchPage extends StatefulWidget {
  List<dynamic> pokemon;
  SearchPage(this.pokemon);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResult = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new)),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      searchResult = searchPokemon(value);
                      setState(() {});
                    },
                    cursorHeight: 22,
                    decoration: InputDecoration(
                        hintText: "Search Pokemon",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
              ],
            ),
            Expanded(
                child: searchResult.isNotEmpty
                    ? Grid(searchResult)
                    : Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'lib/asset/image/pokeball.png',
                              height: 180,
                              // width: 200,
                            ),
                          ),
                        ],
                      ))
          ],
        ),
      ),
    );
  }

  List<dynamic> searchPokemon(String query) {
    return widget.pokemon
        .where((element) =>
            element['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
