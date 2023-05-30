import 'package:flutter/material.dart';

class typeWidg extends StatelessWidget {
  List<dynamic> pokemon;
  int index;
  int no;
  typeWidg(this.pokemon, this.index, this.no);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: Text(pokemon[index]["type"][no]),
      ),
      decoration: BoxDecoration(
          color: Colors.white30, borderRadius: BorderRadius.circular(7)),
    );
  }
}
