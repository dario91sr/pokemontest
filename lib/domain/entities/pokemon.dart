import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pokemontest/domain/entities/pokemonAbility.dart';
import 'package:pokemontest/domain/entities/pokemonStat.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int base_experience;
  final int order;
  final List<PokemonAbility> abilities;
  final bool preferiti;
//final List<PokemonForm> forms;
//final List<VersionGame> game_indices;
//final List<PokemonHeldItem> held_items;
//final String location_area_encounters;
//final List<PokemonMove> moves;
//final List<PokemonTypePast> past_types;
//final PokemonSprites sprites;
//final PokemonSpecies species;
  final List<PokemonStat> stats;
  const Pokemon({
    required this.id,
    required this.name,
    required this.base_experience,
    required this.order,
    required this.abilities,
    this.preferiti = false,
    required this.stats,
  });
//final List<PokemonType> types;

  Pokemon copyWith({
    int? id,
    String? name,
    int? base_experience,
    int? order,
    List<PokemonAbility>? abilities,
    bool? preferiti,
    List<PokemonStat>? stats,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      base_experience: base_experience ?? this.base_experience,
      order: order ?? this.order,
      abilities: abilities ?? this.abilities,
      preferiti: preferiti ?? this.preferiti,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'base_experience': base_experience,
      'order': order,
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] as int,
      name: map['name'] as String,
      base_experience: map['base_experience'] as int,
      order: map['order'] as int,
      abilities: List<PokemonAbility>.from(
        (map['abilities'] as List<dynamic>).map<PokemonAbility>(
          (x) => PokemonAbility.fromMap(x as Map<String, dynamic>),
        ),
      ),
      stats: List<PokemonStat>.from(
        (map['stats'] as List<dynamic>).map<PokemonStat>(
          (x) => PokemonStat.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      base_experience,
      order,
      abilities,
      stats,
    ];
  }
}
