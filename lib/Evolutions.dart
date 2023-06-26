import 'package:flutter/material.dart';

class Evolutions extends StatelessWidget {
  List<dynamic> pokemon;
  int index;
  Color typeColor;
  Evolutions(this.pokemon, this.index, this.typeColor);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //no evolution
    if (pokemon[index]["prev_evolution"] == null &&
        pokemon[index]["next_evolution"] == null) {
      return Container();
    }
    //both pre and next evolutions
    else if (pokemon[index]["prev_evolution"] != null &&
        pokemon[index]["next_evolution"] != null) {
      return Column(
        children: [
          Text(
            "Previous Evolution  :",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
          SizedBox(height: 6),
          Text(
            '${pokemon[index]["prev_evolution"][0]["name"]}',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          SizedBox(height: 12),
          Container(
            width: width - 60,
            height: 1,
            color: typeColor,
          ),
          SizedBox(height: 12),
          Text(
            "Next Evolution  :",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
          SizedBox(height: 6),
          Text(
            '${pokemon[index]["next_evolution"][0]["name"]}',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
        ],
      );
    } else if (pokemon[index]["next_evolution"] == null) {
      return Column(
        children: [
          Text(
            "Previous Evolution  :",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
          SizedBox(height: 6),
          if (pokemon[index]["prev_evolution"].length >= 2)
            Text(
              '${pokemon[index]["prev_evolution"][1]["name"]}',
              style: TextStyle(fontSize: 19, color: Colors.white),
            )
          else
            Text(
              '${pokemon[index]["prev_evolution"][0]["name"]}',
              style: TextStyle(fontSize: 19, color: Colors.white),
            )
        ],
      );
    } else if (pokemon[index]["prev_evolution"] == null) {
      return Column(
        children: [
          Text(
            "Next Evolution  :",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
          SizedBox(height: 6),
          Text(
            '${pokemon[index]["next_evolution"][0]["name"]}',
            style: TextStyle(fontSize: 19, color: Colors.white),
          )
        ],
      );
    }
    return Container();
  }
}
