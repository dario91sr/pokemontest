import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  var filterController = TextEditingController();
  String? filtro = null;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PokemonLoaded) {
          return DefaultTabController(
            length: 2,
            animationDuration: const Duration(milliseconds: 500),
            child: Builder(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  actions: [
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text("Cancella Filtro di Ricerca"),
                            onTap: () => BlocProvider.of<PokemonBloc>(context)
                                .add(FilterPokemon(filter: "")),
                          ),
                        ];
                      },
                    )
                  ],
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
                body: TabBarView(
                  children: [
                    TabUno(),
                    TabDue(),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('Ricerca Pokemon'),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: filterController,
                                      onChanged: (value) {
                                        BlocProvider.of<PokemonBloc>(context)
                                            .add(FilterPokemon(
                                                filter: filterController.text));
                                      },
                                      decoration: const InputDecoration(
                                          labelText: "Inserisci nome",
                                          border: OutlineInputBorder()),
                                    ),
                                  ),
                                  ElevatedButton(
                                      child: const Text("Avvia Ricerca"),
                                      onPressed: () {
                                        BlocProvider.of<PokemonBloc>(context)
                                            .add(FilterPokemon(
                                                filter: filterController.text));
                                        filterController.clear();
                                        Navigator.pop(context);
                                      }),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Icon(Icons.search),
                ),
              );
            }),
          );
        } else {
          return Text("Errore");
        }
      },
    );
  }
}
