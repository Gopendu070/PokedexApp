import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/PokeScreen.dart';
import 'package:pokedex/typeWidg.dart';

class Grid extends StatelessWidget {
  List<dynamic> _pokemon;
  Grid(this._pokemon);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _pokemon.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 167,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PokeScreen(_pokemon, index, typeColor(index))));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: typeColor(index),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Image.asset(
                      'lib/asset/image/pokeball.png',
                      height: 115,
                    ),
                  ),
                  Positioned(
                    right: -8,
                    bottom: -9,
                    child: Hero(
                      tag: _pokemon[index]["num"],
                      child: CachedNetworkImage(
                        imageUrl: _pokemon[index]["img"],
                        height: 140,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 11,
                    child: Text(
                      _pokemon[index]['name'],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                      top: 58,
                      left: 18,
                      child: _pokemon[index]['type'].length > 1
                          ? Column(
                              children: [
                                typeWidg(_pokemon, index, 0),
                                typeWidg(_pokemon, index, 1),
                              ],
                            )
                          : typeWidg(_pokemon, index, 0))
                ],
              ),
            ),
          );
        }));
  }

  Color typeColor(int index) {
    return _pokemon[index]['type'][0] == "Grass"
        ? Color.fromARGB(202, 95, 234, 167)
        : _pokemon[index]['type'][0] == "Fire"
            ? Colors.redAccent
            : _pokemon[index]['type'][0] == "Water"
                ? Colors.blueAccent
                : _pokemon[index]['type'][0] == "Poison"
                    ? Colors.deepPurpleAccent
                    : _pokemon[index]['type'][0] == "Electric"
                        ? Colors.amber
                        : _pokemon[index]['type'][0] == "Rock"
                            ? Color.fromARGB(177, 22, 21, 21)
                            : _pokemon[index]['type'][0] == "Ground"
                                ? Colors.brown
                                : _pokemon[index]['type'][0] == "Psychic"
                                    ? Color.fromARGB(255, 50, 66, 155)
                                    : _pokemon[index]['type'][0] == "Fighting"
                                        ? Colors.orange
                                        : _pokemon[index]['type'][0] == "Bug"
                                            ? Colors.lightGreen
                                            : _pokemon[index]['type'][0] ==
                                                    "Ghost"
                                                ? Color.fromARGB(
                                                    255, 80, 45, 140)
                                                : _pokemon[index]['type'][0] ==
                                                        "Ice"
                                                    ? Color.fromARGB(
                                                        255, 3, 175, 255)
                                                    : _pokemon[index]['type']
                                                                [0] ==
                                                            "Normal"
                                                        ? Colors.blueGrey
                                                        : Colors.pink;
  }
}
