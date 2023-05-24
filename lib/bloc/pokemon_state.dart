// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  late final List<Pokemon> pokemons;
  late final List<Pokemon> pokemonsPref;
  late final int currentPage;

  PokemonState(this.pokemons, this.currentPage, this.pokemonsPref);

  @override
  List<Object> get props => [pokemons];
}

class PokemonInitial extends PokemonState {
  PokemonInitial(super.pokemons, super.currentPage, super.pokemonsPref);
}

class PokemonLoading extends PokemonState {
  PokemonLoading(super.pokemons, super.currentPage, super.pokemonsPref);
}

class PokemonLoaded extends PokemonState {
  late final List<Pokemon> pokemons;
  late final List<Pokemon> pokemonsPref;
  final int currentPage;

  PokemonLoaded(this.pokemons, this.currentPage, this.pokemonsPref)
      : super(pokemons, currentPage, pokemonsPref);

  @override
  // TODO: implement props
  List<Object> get props => [pokemons, currentPage];
}

class PokemonError extends PokemonState {
  late final String errore;
  PokemonError(this.errore) : super([], 0, []);
}
