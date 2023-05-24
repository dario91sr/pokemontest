import 'package:flutter/material.dart';
import 'package:pokemontest/presentation/screen/PokemonDetail.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case PokemonDetail.pageid:
        return MaterialPageRoute(
          builder: (_) => PokemonDetail(id: arguments as int),
        );
    }
  }
}
