import 'package:flutter/material.dart';
import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pokedex",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoading) {
              return Text("Caricamento");
            }
            if (state is PokemonLoaded) {
              return Container(
                child: ListView.builder(
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () =>
                            PokeApiRepository().getPokemon(id: index + 1),
                        child: Card(
                          child: Text(state.pokemons[index].name),
                        ));
                  },
                ),
              );
            } else {
              return Text("Errore");
            }
          },
        ));
  }
}
