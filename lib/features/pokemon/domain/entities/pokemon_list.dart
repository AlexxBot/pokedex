import 'package:pokedex/features/pokemon/domain/entities/pokemon.dart';

class PokemonList {
  final int count;
  final String? next;
  final String? previous;
  List<Pokemon> list;

  PokemonList(
      {required this.count, this.next, this.previous, required this.list});

  factory PokemonList.fromJson(Map<dynamic, dynamic> json) {
    return PokemonList(
        count: int.parse(json['count'].toString()),
        next: json['next'],
        previous: json['previous'],
        list: (json['results'] as List)
            .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
            .toList());
  }
}
