import 'package:flutter/material.dart';
import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/presentation/widget/cardpokemon.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      animationDuration: Duration(seconds: 1),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text(
              "Pokedex",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [Text("Lista Pokemon"), Text("Preferiti"), Tab()]),
          ),
          body: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PokemonLoaded) {
                return TabBarView(children: [
                  Container(
                    child: ListView.builder(
                      itemCount: state.pokemons.length,
                      itemBuilder: (context, index) {
                        var pokemon = state.pokemons[index];
                        return GestureDetector(
                            onTap: () =>
                                PokeApiRepository().getPokemon(id: index + 1),
                            child: cardPokemon(pokemon));
                      },
                    ),
                  ),
                ]);
              } else {
                return Text("Errore");
              }
            },
          )),
    );
  }
}
