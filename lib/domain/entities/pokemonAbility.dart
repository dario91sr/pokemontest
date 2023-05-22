// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonAbility extends Equatable {
  final int id;
  final String name;
  PokemonAbility({
    required this.id,
    required this.name,
  });

  PokemonAbility copyWith({
    int? id,
    String? name,
  }) {
    return PokemonAbility(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

/*
  factory PokemonAbility.fromMap(Map<String, dynamic> map) {
    return PokemonAbility(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }*/
  factory PokemonAbility.fromMap(Map<String, dynamic> map) {
    var url = map['ability']['url'] as String;
    return PokemonAbility(
      id: int.parse(url.split('/')[6]),
      name: map['ability']['name'] as String,
    );
  }
  String toJson() => json.encode(toMap());

  factory PokemonAbility.fromJson(String source) =>
      PokemonAbility.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
