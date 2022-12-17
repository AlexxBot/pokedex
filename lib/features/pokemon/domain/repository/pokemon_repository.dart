import 'package:dartz/dartz.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_list.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonList>> getList(String? url);
}
