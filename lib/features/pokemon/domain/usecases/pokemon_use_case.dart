import 'package:dartz/dartz.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_list.dart';

abstract class UseCase {
  Future<Either<Failure, PokemonList>> getList(String? url);
}

class PokemonUseCase implements UseCase {
  final PokemonRepository repository;

  PokemonUseCase({required this.repository});

  @override
  Future<Either<Failure, PokemonList>> getList(String? url) async {
    return await repository.getList(url);
  }
}
