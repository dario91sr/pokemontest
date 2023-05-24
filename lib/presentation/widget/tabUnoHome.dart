// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/presentation/widget/cardpokemon.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';

class TabUno extends StatefulWidget {
  //PokemonState state;
  TabUno({
    Key? key,
    //required this.state,
  }) : super(key: key);
  @override
  State<TabUno> createState() => _TabUnoState();
}

class _TabUnoState extends State<TabUno> {
  List<Pokemon> pref = [];
  caricaPref(PokemonState state) {
    pref.clear();
    state.pokemons.forEach((element) {
      if (element.visible == true) {
        pref.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PokemonBloc>(context);
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        caricaPref(state);
        var scrollContr = ScrollController();
        return ListView.builder(
          controller: scrollContr,
          itemCount: pref.length + 1,
          itemBuilder: (ctx, index) {
            if (index == pref.length) {
              return InkWell(
                  onTap: () {
                    BlocProvider.of<PokemonBloc>(context).add(DownloadPokeList(
                        page: state.currentPage + 1, numItem: 50));
                  },
                  child: Center(
                    child: Column(
                      children: [
                        Text("Scarica altri 50 pokemon"),
                        Icon(Icons.arrow_circle_down_sharp),
                      ],
                    ),
                  ));
            } else {
              var pokemon = pref[index];
              return InkWell(
                  onTap: () {
                    /*  
                      BlocProvider.of<PokemonBloc>(context)
                          .add(AddFavorite(id: pokemon.id));
                    */
                  },
                  child: CardWidget(id: pokemon.id));
            }
          },
        );
      },
    );
  }
}
