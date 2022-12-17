import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon/presentation/pages/pokemon_detail_page.dart';
import 'package:pokedex/features/pokemon/presentation/pages/pokemon_page.dart';

class RouteGenerator {
  static const String pokemonPage = '/';
  static const String pokemonDetailPage = '/detail';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pokemonPage:
        return MaterialPageRoute(builder: (_) => const PokemonPage());
      case pokemonDetailPage:
        //final navBarItem = settings.arguments as NavBarItem;
        return MaterialPageRoute(builder: (_) => const PokemonDetailPage());

      default:
        return MaterialPageRoute(builder: (_) => const PokemonPage());
    }
  }
}
