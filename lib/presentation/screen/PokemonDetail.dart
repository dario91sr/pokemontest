// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontest/bloc/pokemon_bloc.dart';
import 'package:pokemontest/domain/data/constants.dart';
import 'package:pokemontest/presentation/widget/percentualindicator.dart';

class PokemonDetail extends StatefulWidget {
  int id;
  PokemonDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  static const String pageid = "detail";

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;

    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          return CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(state.pokemons[widget.id - 1].name),
                background: Image.network(
                  "${baseUrlImage + state.pokemons[widget.id - 1].id.toString()}.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                    "Caratteristiche"), //state.pokemons[widget.id - 1].stats[0].name),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.pokemons[widget.id - 1].stats.length,
                (BuildContext context, int index) {
                  var stat = state.pokemons[widget.id - 1].stats[index];
                  return Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PercentualIndicator(
                            value: stat.base_stat.toDouble()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
