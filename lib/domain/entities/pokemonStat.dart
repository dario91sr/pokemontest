// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonStat extends Equatable {
  final int id;
  final String name;
  final int base_stat;
  const PokemonStat({
    required this.id,
    required this.name,
    required this.base_stat,
  });

  PokemonStat copyWith({
    int? id,
    String? name,
    int? base_stat,
  }) {
    return PokemonStat(
      id: id ?? this.id,
      name: name ?? this.name,
      base_stat: base_stat ?? this.base_stat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'base_stat': base_stat,
    };
  }

  factory PokemonStat.fromMap(Map<String, dynamic> map) {
    var url = map['stat']['url'] as String;
    return PokemonStat(
      id: int.parse(url.split('/')[6]),
      name: map['stat']['name'] as String,
      base_stat: map['base_stat'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStat.fromJson(String source) =>
      PokemonStat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, base_stat];
}
