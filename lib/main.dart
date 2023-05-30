import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'typeWidg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _pokemon = [];
  @override
  void initState() {
    readPokeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(241, 78, 93, 102),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.search_outlined),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 5),
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Container(
                  height: 90,
                  width: 200,
                  child: Image.asset('lib/asset/image/pokedex.png'),
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: GridView.builder(
                    itemCount: _pokemon.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 167,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: ((context, index) {
                      return Card(
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
                              child: CachedNetworkImage(
                                imageUrl: _pokemon[index]["img"],
                                height: 140,
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
                      );
                    })))
          ]),
        ]),
      ),
    );
  }

//Reading data from pokedex.json
  Future<void> readPokeData() async {
    String response = await rootBundle.loadString('lib/asset/pokedex.json');
    final data = await json.decode(response);
    setState(() {
      _pokemon = data["pokemon"];
    });
    print(_pokemon.length);
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
                            ? Color.fromARGB(102, 35, 34, 34)
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
