part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  late final List<PokemonList> pokemons;
  PokemonLoaded(this.pokemons);
}

class PokemonError extends PokemonState {
  late final String errore;
  PokemonError(this.errore);
}
