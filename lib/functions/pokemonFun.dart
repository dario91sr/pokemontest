import 'package:flutter/material.dart';

class PokemonFuncion {
  static Color setColorPoke(String name) {
    switch (name) {
      case "normal":
        return Colors.grey;
      case "fighting":
        return Colors.purple;
      case "flying":
        return Colors.cyanAccent;
      case "poison":
        return Colors.deepPurpleAccent;
      case "ground":
        return Colors.grey;
      case "rock":
        return const Color.fromARGB(255, 46, 48, 49);
      case "bug":
        return Colors.grey;
      case "ghost":
        return Colors.grey;
      case "steel":
        return Colors.grey;
      case "fire":
        return Colors.red;
      case "water":
        return Colors.lightBlue;
      case "grass":
        return Colors.green;
      case "electric":
        return Colors.yellow;
      case "psychic":
        return Colors.deepPurple;
      case "ice":
        return Colors.grey;
      case "dragon":
        return Colors.blue;
      case "dark":
        return Colors.black12;
      case "fairy":
        return Colors.pink;
      case "unknown":
        return Colors.grey;
      case "shadow":
        return Colors.grey;

      default:
        return Colors.blue;
    }
  }
}
