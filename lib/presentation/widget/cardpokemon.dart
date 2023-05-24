// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/data/constants.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/presentation/screen/PokemonDetail.dart';

class CardWidget extends StatefulWidget {
  int id;
  CardWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PokemonBloc>(context);
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
          child: Stack(fit: StackFit.passthrough, children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PokemonDetail.pageid,
                    arguments: widget.id);
              },
              child: Card(
                color: Colors.green,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Image.network(
                          "${baseUrlImage + state.pokemons[widget.id - 1].id.toString()}.png",
                          fit: BoxFit.fill,
                          width: 250,
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "#${state.pokemons[widget.id - 1].id}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(state.pokemons[widget.id - 1].name.capitalize(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 15,
                top: 15,
                child: IconButton(
                    onPressed: () {
                      bloc.add(
                          AddFavorite(id: state.pokemons[widget.id - 1].id));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: state.pokemons[widget.id - 1].preferiti != true
                          ? Colors.white
                          : Colors.red,
                      size: 30,
                    )))
          ]),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
