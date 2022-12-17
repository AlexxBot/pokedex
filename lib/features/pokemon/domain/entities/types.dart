/* enum Types {
  grass,
  fire,
  normal,
  bug,
  water,
} */

import 'package:flutter/material.dart';

class TypesColors {
  static Color getColor(String type) {
    switch (type) {
      case 'grass':
        return Colors.green.withOpacity(0.9);
      case 'fire':
        return Colors.red.withOpacity(0.9);
      case 'normal':
        return Colors.yellowAccent.withOpacity(0.9);
      case 'bug':
        return Colors.lightGreenAccent.withOpacity(0.9);
      case 'water':
        return Colors.blueAccent.withOpacity(0.9);
      case 'poison':
        return Colors.deepPurpleAccent.withOpacity(0.9);
      case 'psychic':
        return Colors.purple.withOpacity(0.9);
      case 'rock':
        return Colors.brown.withOpacity(0.9);
      case 'ground':
        return Colors.brown.withOpacity(0.9);
      case 'electric':
        return Colors.yellowAccent.withOpacity(0.9);
      case 'fairy':
        return Colors.pink.withOpacity(0.9);
      default:
        return Colors.grey.withOpacity(0.9);
    }
  }
}
