// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class DownloadPokeList extends PokemonEvent {
  int page;
  DownloadPokeList({
    required this.page,
  });
}

class AddFavorite extends PokemonEvent {
  int id;
  AddFavorite({
    required this.id,
  });
}
