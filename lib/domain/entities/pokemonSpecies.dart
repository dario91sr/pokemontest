// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonTypes extends Equatable {
  int slot;
  Map<String, dynamic> type;
  PokemonTypes({required this.slot, required this.type});

  PokemonTypes copyWith({
    int? slot,
    Map<String, dynamic>? type,
    String? idType,
  }) {
    return PokemonTypes(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slot': slot,
      'type': type,
    };
  }

  factory PokemonTypes.fromMap(Map<String, dynamic> map) {
    return PokemonTypes(
      slot: map['slot'] as int,
      type: Map<String, dynamic>.from(
        (map['type'] as Map<String, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonTypes.fromJson(String source) =>
      PokemonTypes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [slot, type];
}
