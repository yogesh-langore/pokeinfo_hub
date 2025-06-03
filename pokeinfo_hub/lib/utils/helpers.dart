import 'package:flutter/material.dart';
import 'package:pokeinfo_hub/utils/constants.dart';

class Helpers {
  static Color? getPokemonCardColour({required String pokemonType}) {
    switch (pokemonType) {
      case 'Normal':
        return lightBlue;
      case 'Fire':
        return darkRed;
      case 'Water':
        return lightBlue;
      case 'Electric':
        return Colors.amber;
      case 'Grass':
        return lightGreen;
      case 'Ice':
        return lightBlue;
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.deepPurpleAccent;
      case 'Ground':
        return Colors.brown;
      case 'Glying':
        return darkblue;
      case 'Psychic':
        return darkYellow;
      case 'Bug':
        return Colors.green[200];
      case 'Rock':
        return Colors.grey[500];
      case 'Ghost':
        return Colors.deepPurple;
      default:
        return lightBlue;
    }
  }
}
