// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonList extends Equatable {
  final int id;
  final String name;
  final String imgPath;

  const PokemonList({
    required this.id,
    required this.name,
    required this.imgPath,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    final imgPath =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";
    return PokemonList(id: id, name: name, imgPath: imgPath);
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, name, imgPath];

  PokemonList copyWith({
    int? id,
    String? name,
    String? imgPath,
  }) {
    return PokemonList(
      id: id ?? this.id,
      name: name ?? this.name,
      imgPath: imgPath ?? this.imgPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imgPath': imgPath,
    };
  }

  factory PokemonList.fromMap(Map<String, dynamic> map) {
    return PokemonList(
      id: map['id'] as int,
      name: map['name'] as String,
      imgPath: map['imgPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}
