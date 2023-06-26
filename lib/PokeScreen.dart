import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/typeWidg.dart';
import 'package:pokedex/weakness.dart';

import 'Evolutions.dart';

class PokeScreen extends StatefulWidget {
  List<dynamic> _pokemon;
  int index;
  Color typeColor;
  PokeScreen(this._pokemon, this.index, this.typeColor);

  @override
  State<PokeScreen> createState() => _PokeScreenState();
}

class _PokeScreenState extends State<PokeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var name = widget._pokemon[widget.index]["name"];
    var typ = widget._pokemon[widget.index]["type"];
    var hi = widget._pokemon[widget.index]["height"];
    var wei = widget._pokemon[widget.index]["weight"];
    var weakness = widget._pokemon[widget.index]["weakness"];

    return Scaffold(
      // appBar: AppBar(title: Text(widget._pokemon[widget.index]["name"])),
      body: Stack(
        children: [
          //Backgoround
          Container(
            height: height,
            width: width,
            color: widget.typeColor,
            child: Stack(children: [
              Positioned(
                  top: 45,
                  left: 22,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
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
                      widget._pokemon[widget.index]["type"].length > 1
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                typeWidg(widget._pokemon, widget.index, 0),
                                typeWidg(widget._pokemon, widget.index, 1),
                              ],
                            )
                          : typeWidg(widget._pokemon, widget.index, 0),
                    ],
                  )),
            ]),
          ),
          //pokeball watermark
          Positioned(
            bottom: (height / 2) - 30,
            right: -35,
            child: Image.asset(
              'lib/asset/image/pokeball.png',
              height: 300,
              width: 200,
            ),
          ),
          //Dark Screen
          Positioned(
            top: (height / 2) - 40,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                width: width,
                height: (height / 2) + 60,
                color: Colors.grey[850],
                child: Stack(children: [
                  Positioned(
                    left: width / 3 - 20,
                    top: height / 8 - 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name  : \t\t\t\t$name',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white60)),
                        SizedBox(height: 10),
                        Text('Type  : \t\t\t\t$typ',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white60)),
                        SizedBox(height: 10),
                        Text('Height  :\t\t\t\t$hi',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white60)),
                        SizedBox(height: 10),
                        Text('Weight  :\t\t\t\t$wei',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white60)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height / 4 + 4,
                    left: 30,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width - 60,
                          height: 1,
                          color: widget.typeColor,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Weakness  :",
                          style: TextStyle(fontSize: 20, color: Colors.white60),
                        ),
                        SizedBox(height: 6),
                        Container(
                          width: width - 60,
                          height: 30,
                          padding: widget._pokemon[widget.index]["weaknesses"]
                                      .length ==
                                  1
                              ? EdgeInsets.only(left: width / 3)
                              : widget._pokemon[widget.index]["weaknesses"]
                                          .length ==
                                      2
                                  ? EdgeInsets.only(left: width / 4)
                                  : widget._pokemon[widget.index]["weaknesses"]
                                              .length ==
                                          3
                                      ? EdgeInsets.only(left: width / 5)
                                      : EdgeInsets.only(left: width / 8 - 10),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget
                                      ._pokemon[widget.index]["weaknesses"]
                                      .length,
                                  itemBuilder: (context, index1) {
                                    return Container(
                                      margin: EdgeInsets.all(4),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                            top: 3,
                                            bottom: 3),
                                        child: Text(
                                          widget._pokemon[widget.index]
                                              ["weaknesses"][index1],
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white30,
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Positioned(
                          left: 30,
                          child: Container(
                            width: width - 60,
                            height: 1,
                            color: widget.typeColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        //Evolutions of the pokemon

                        Evolutions(
                            widget._pokemon, widget.index, widget.typeColor),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Positioned(
            bottom: height / 2,
            left: width / 2 - 100,
            child: Hero(
              tag: widget._pokemon[widget.index]["num"],
              child: CachedNetworkImage(
                imageUrl: '${widget._pokemon[widget.index]["img"]}',
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
