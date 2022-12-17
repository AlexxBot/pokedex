import 'dart:convert';
import 'package:pokedex/core/errors/exceptions.dart';
import 'package:pokedex/core/network/headers.dart';
import 'package:pokedex/core/network/network_info.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/injections.dart';

abstract class PokemonRemoteData {
  Future<PokemonList> getList(String? url);
  Future<PokemonDetail> getPokemon(String url);
}

class PokemonRemoteDataImple extends PokemonRemoteData {
  late final http.Client client;

  PokemonRemoteDataImple({required this.client});

  @override
  Future<PokemonList> getList(String? url) async {
    final uri = Uri.parse(url ?? sl<NetworkInfo>().url);
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
            onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      final pokemonListJson = jsonDecode(response.body);
      //final listPokemons = listJson['results'];
      final pokemonList = PokemonList.fromJson(pokemonListJson);
      /*  final List<Pokemon> list = listPokemons
          .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
          .toList(); */
      final n = pokemonList.list.length;
      for (int i = 0; i < n; i++) {
        pokemonList.list[i].detail = await getPokemon(pokemonList.list[i].url);
      }
      return pokemonList;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<PokemonDetail> getPokemon(String url) async {
    final uri = Uri.parse(url);
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
            onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      final pokemonJson = jsonDecode(response.body);

      final pokemon = PokemonDetail.fromJson(pokemonJson);
      return pokemon;
    }
    return PokemonDetail(name: '');
  }
}
