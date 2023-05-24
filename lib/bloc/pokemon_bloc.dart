import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemontest/domain/entities/pokemon.dart';
import 'package:pokemontest/domain/entities/pokemonList.dart';
import 'package:pokemontest/repository/pokemonRepository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokeRepo = PokeApiRepository();

  PokemonBloc() : super(PokemonInitial(const [], 0, [])) {
    on<DownloadPokeList>((event, emit) async {
      emit(PokemonLoading(
          state.pokemons, state.currentPage, state.pokemonsPref));

      List<Pokemon> pokemonList = [...state.pokemons];
      // pokemonList.clear();
      List<PokemonList> pokemons = await _pokeRepo.getPokemonsList(
          page: event.page, numItem: event.numItem);
      for (var i = 0; i < pokemons.length; i++) {
        Pokemon? p = await _pokeRepo.getPokemon(id: pokemons[i].id);
        if (p != null) pokemonList.add(p);
      }

      if (pokemons.isNotEmpty) {
        emit(PokemonLoaded(pokemonList, event.page, state.pokemonsPref));
      } else {
        emit(PokemonError("Errore"));
      }
    });

    on<AddFavorite>((event, emit) async {
      emit(PokemonLoading(
          state.pokemons, state.currentPage, state.pokemonsPref));

      List<Pokemon> pokemons = [...state.pokemons];
      List<Pokemon> pokemonPref = [...state.pokemonsPref];

      bool pref = !pokemons[event.id - 1].preferiti;
      pokemons[event.id - 1] = pokemons[event.id - 1].copyWith(preferiti: pref);
      if (pref) pokemonPref.add(pokemons[event.id - 1]);
      if (!pref)
        pokemonPref.removeWhere(
          (element) => element.id == pokemons[event.id - 1].id,
        );
      emit(PokemonLoaded(pokemons, state.currentPage, pokemonPref));
    });

    on<FilterPokemon>((event, emit) {
      emit(PokemonLoading(
          state.pokemons, state.currentPage, state.pokemonsPref));
      List<Pokemon> pokemons = [...state.pokemons];
      //reset valore
      for (var i = 0; i < pokemons.length; i++) {
        pokemons[i] = pokemons[i].copyWith(visible: true);
      }
      //filtra dato
      if (event.filter.isNotEmpty) {
        for (var i = 0; i < pokemons.length; i++) {
          if (/* pokemons[i].name != event.filter */ !pokemons[i]
              .name
              .contains(event.filter)) {
            bool visible = false;
            pokemons[i] = pokemons[i].copyWith(visible: visible);
          }
        }
      }
      emit(PokemonLoaded(pokemons, state.currentPage, state.pokemonsPref));
    });
  }
}
