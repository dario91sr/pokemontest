import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/domain/entities/pokemonList.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokeRepo = PokeApiRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<DownloadPokeList>((event, emit) async {
      emit(PokemonLoading());

      List<Pokemon> pokemonList = [];
      List<PokemonList> pokemons =
          await _pokeRepo.getPokemonsList(page: event.page);
      for (var i = 0; i < pokemons.length; i++) {
        Pokemon? p = await _pokeRepo.getPokemon(id: pokemons[i].id);
        if (p != null) pokemonList.add(p);
      }

      if (pokemons.isNotEmpty) {
        emit(PokemonLoaded(pokemonList));
      } else {
        emit(PokemonError("Errore"));
      }
    });
  }
}
