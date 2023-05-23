// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  late final List<Pokemon> pokemons;

  PokemonState(this.pokemons);

  @override
  List<Object> get props => [pokemons];
}

class PokemonInitial extends PokemonState {
  PokemonInitial(super.pokemons);
}

class PokemonLoading extends PokemonState {
  PokemonLoading(super.pokemons);
}

class PokemonLoaded extends PokemonState {
  late final List<Pokemon> pokemons;

  PokemonLoaded(this.pokemons) : super(pokemons);

  @override
  // TODO: implement props
  List<Object> get props => [pokemons];
}

class PokemonError extends PokemonState {
  late final String errore;
  PokemonError(this.errore) : super([]);
}
