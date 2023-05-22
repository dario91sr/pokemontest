import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemontest/Domain/Entities/pokemon.dart';
import 'package:pokemontest/Domain/Entities/pokemonList.dart';
import 'package:pokemontest/Repository/pokemonRepository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokeRepo = PokeApiRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<DownloadPokeList>((event, emit) async {
      emit(PokemonLoading());
      List<PokemonList> pokemons =
          await _pokeRepo.getPokemonsList(page: event.page);
      if (pokemons.isNotEmpty) {
        emit(PokemonLoaded(pokemons));
      } else {
        emit(PokemonError("Errore"));
      }
    });
  }
}
