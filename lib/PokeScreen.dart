import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/typeWidg.dart';
import 'package:pokedex/weakness.dart';

import 'Evolutions.dart';

class PokeScreen extends StatelessWidget {
  final List<dynamic> pokemon;
  final int index;
  final Color typeColor;

  PokeScreen(this.pokemon, this.index, this.typeColor);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var name = pokemon[index]["name"];
    var typ = pokemon[index]["type"];
    var hi = pokemon[index]["height"];
    var wei = pokemon[index]["weight"];
    var weakness = pokemon[index]["weaknesses"];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: typeColor,
            child: Stack(
              children: [
                Positioned(
                  top: 45,
                  left: 22,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: height / 8,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      typ.length > 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                typeWidg(pokemon, index, 0),
                                typeWidg(pokemon, index, 1),
                              ],
                            )
                          : typeWidg(pokemon, index, 0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: (height / 2) - 30,
            right: -35,
            child: Image.asset(
              'lib/asset/image/pokeball.png',
              height: 300,
              width: 200,
            ),
          ),
          Positioned(
            top: (height / 2) - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                width: width,
                height: (height / 2) + 60,
                color: Colors.grey[850],
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name: $name',
                        style: TextStyle(fontSize: 20, color: Colors.white60),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Type: $typ',
                        style: TextStyle(fontSize: 20, color: Colors.white60),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Height: $hi',
                        style: TextStyle(fontSize: 20, color: Colors.white60),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Weight: $wei',
                        style: TextStyle(fontSize: 20, color: Colors.white60),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: width - 60,
                      height: 1,
                      color: typeColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Weakness:",
                      style: TextStyle(fontSize: 20, color: Colors.white60),
                    ),
                    // SizedBox(height: 6),
                    Padding(
                      padding: pokemon[index]["weaknesses"].length == 1
                          ? EdgeInsets.only(left: width / 2.5)
                          : pokemon[index]["weaknesses"].length == 2
                              ? EdgeInsets.only(left: width / 3 + 7)
                              : pokemon[index]["weaknesses"].length == 3
                                  ? EdgeInsets.only(left: width / 3.5)
                                  : EdgeInsets.only(left: width / 4 - 20),
                      child: Container(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: weakness.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                  top: 3,
                                  bottom: 3,
                                ),
                                child: Text(
                                  weakness[index1],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(13),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: width - 60,
                      height: 1,
                      color: typeColor,
                    ),
                    SizedBox(height: 10),
                    Evolutions(pokemon, index, typeColor),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height / 2 + 10,
            left: width / 2 - 100,
            child: Hero(
              tag: pokemon[index]["num"],
              child: CachedNetworkImage(
                imageUrl: '${pokemon[index]["img"]}',
                filterQuality: FilterQuality.high,
                height: 190,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
