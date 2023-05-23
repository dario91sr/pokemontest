import 'package:flutter/material.dart';
import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/presentation/widget/cardpokemon.dart';
import 'package:pokemontest/presentation/widget/tabDueHome.dart';
import 'package:pokemontest/presentation/widget/tabUnoHome.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                text: "Lista Pokemon",
              ),
              Tab(
                text: "Preferiti",
              )
            ]),
          ),
          body: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PokemonLoaded) {
                return TabBarView(children: [
                  TabUno(state: state),
                  //  tabDue(context, state.pokemons),
                ]);
              } else {
                return Text("Errore");
              }
            },
          )),
    );
  }
}
