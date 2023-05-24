// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/presentation/widget/cardpokemon.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';

class TabUno extends StatefulWidget {
  PokemonState state;
  TabUno({
    Key? key,
    required this.state,
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
        return ListView.builder(
          itemCount: pref.length,
          itemBuilder: (ctx, index) {
            var pokemon = pref[index];
            return InkWell(
                onTap: () {
                  /*  
                      BlocProvider.of<PokemonBloc>(context)
                          .add(AddFavorite(id: pokemon.id));
                    */
                },
                child: CardWidget(id: pokemon.id));
          },
        );
      },
    );
  }
}
