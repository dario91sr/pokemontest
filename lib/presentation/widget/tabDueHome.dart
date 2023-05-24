// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/presentation/widget/cardpokemon.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';

class TabDue extends StatefulWidget {
  //PokemonState state;
  TabDue({
    Key? key,
    //  required this.state,
  }) : super(key: key);
  @override
  State<TabDue> createState() => _TabDueState();
}

class _TabDueState extends State<TabDue> {
  List<Pokemon> pref = [];

  caricaPref(PokemonState state) {
    pref.clear();
    state.pokemons.forEach((element) {
      if (element.preferiti == true) {
        pref.add(element);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        caricaPref(state);
        return ListView.builder(
            itemCount: state.pokemonsPref.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                  onTap: () {
                    /*  
                          BlocProvider.of<PokemonBloc>(context)
                              .add(AddFavorite(id: pokemon.id));
                        */
                  },
                  child: CardWidget(id: state.pokemonsPref[index].id));
            });
      },
    );
  }
}
