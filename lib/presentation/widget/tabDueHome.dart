import 'package:flutter/material.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/presentation/widget/cardpokemon.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';

/*tabDue(BuildContext context, List<Pokemon> pokemons) => ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        var pokemon = pokemons[index];
        return GestureDetector(
            onTap: () => PokeApiRepository().getPokemon(id: index + 1),
            child: CardWidget(pokemon: pokemon));
      },
    );
*/