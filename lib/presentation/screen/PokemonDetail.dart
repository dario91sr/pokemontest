// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/data/constants.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/functions/pokemonFun.dart';
import 'package:pokemontest/presentation/widget/abilitiesContainer.dart';
import 'package:pokemontest/presentation/widget/percentualindicator.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetail({Key? key, required this.pokemon}) : super(key: key);

  static const String pageid = "detail";

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: PokemonFuncion.setColorPoke(
              widget.pokemon.types.first.type['name']),
          pinned: true,
          snap: false,
          floating: true,
          expandedHeight: 180.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              widget.pokemon.name.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            background: Image.network(
              "${baseUrlImage + widget.pokemon.id.toString()}.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Abilità",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), //state.pokemons[widget.id - 1].stats[0].name),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  abilitiesContainer(widget.pokemon.abilities[0].name),
                  SizedBox(
                    width: 15,
                  ),
                  abilitiesContainer(widget.pokemon.abilities[1].name),
                ],
              ),
            ), //state.pokemons[widget.id - 1].stats[0].name),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Caratteristiche",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), //state.pokemons[widget.id - 1].stats[0].name),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widget.pokemon.stats.length,
            (BuildContext context, int index) {
              var stat = widget.pokemon.stats[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PercentualIndicator(
                          value: stat.base_stat.toDouble(),
                          color: PokemonFuncion.setColorPoke(
                              widget.pokemon.types.first.type['name']),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          stat.base_stat.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      stat.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
