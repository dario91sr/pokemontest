import 'package:flutter/material.dart';
import 'package:pokemontest/domain/entities/pokemonList.dart';

Widget cardPokemon(PokemonList pokemon) {
  return Card(
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.network(
            pokemon.imgPath,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null)
                return child;
              else
                return CircularProgressIndicator();
            },
          ),
        ),
        Text(
          "#${pokemon.id}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(pokemon.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    ),
  );
}
