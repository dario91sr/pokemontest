import 'dart:convert';

import 'package:pokemontest/Domain/Entities/pokemon.dart';
import 'package:pokemontest/Domain/Entities/pokemonAbility.dart';
import 'package:dio/dio.dart';
import 'package:pokemontest/Domain/Entities/pokemonList.dart';
import 'package:pokemontest/Domain/Entities/pokemonStat.dart';

abstract class PokemonRepository {
  Future<List<PokemonList>> getPokemonsList({required int page});
  Future<Pokemon?> getPokemon({required int id});
  Future<PokemonAbility> getAbility({required int id});
  Future<PokemonStat> getStat({required int id});
}

class PokeApiRepository implements PokemonRepository {
  final baseUrl = 'https://pokeapi.co/api/v2/';
  final dio = Dio();

  @override
  Future<Pokemon?> getPokemon({required int id}) async {
    Pokemon pokemon;

    final response = await dio.get("${baseUrl}pokemon/$id");

    if (response.statusCode == 200) {
      pokemon = Pokemon.fromMap(response.data as Map<String, dynamic>);
      print(pokemon);
      return pokemon;
    } else {
      return null;
    }
  }

  @override
  Future<List<PokemonList>> getPokemonsList({required int page}) async {
    List<PokemonList> pokemonList = [];

    final parametri = {'limit': '50', 'offset': (page * 50).toString()};

    final response =
        await dio.get("${baseUrl}pokemon", queryParameters: parametri);

    if (response.statusCode == 200) {
      pokemonList = (response.data['results'] as List)
          .map((listJson) => PokemonList.fromJson(listJson))
          .toList();
    }
    return pokemonList;
  }

  @override
  Future<PokemonStat> getStat({required int id}) {
    // TODO: implement getStat
    throw UnimplementedError();
  }

  @override
  Future<PokemonAbility> getAbility({required int id}) {
    // TODO: implement getAbility
    throw UnimplementedError();
  }
}
