import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_detail.dart';
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
        final pokemonDetail = settings.arguments as PokemonDetail;
        return MaterialPageRoute(
            builder: (_) => PokemonDetailPage(
                  detail: pokemonDetail,
                ));

      default:
        return MaterialPageRoute(builder: (_) => const PokemonPage());
    }
  }
}
