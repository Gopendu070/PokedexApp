import 'package:flutter/material.dart';

class Weakness extends StatelessWidget {
  List<dynamic> pokemon;
  int index;
  int no;
  Weakness(this.pokemon, this.index, this.no);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
        child: Text(
          pokemon[index]["weaknesses"][no],
          style: TextStyle(fontSize: 15),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white30, borderRadius: BorderRadius.circular(13)),
    );
  }
}
