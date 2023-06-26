import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/SearchPage.dart';
import 'package:pokedex/splash1.dart';
import 'Grid.dart';

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
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(_pokemon),
            )),
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  color: Color.fromARGB(255, 67, 67, 67),
                  child: Center(
                    child: SizedBox(
                      width: 210,
                      child: Image.asset(
                        'lib/asset/image/pokedex.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Grid(_pokemon), //Responsible for the Grid view
            )
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
}
