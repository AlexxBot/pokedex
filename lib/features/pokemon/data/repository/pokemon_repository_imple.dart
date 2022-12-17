import 'package:pokedex/core/errors/exceptions.dart';
import 'package:pokedex/core/network/network_info.dart';
import 'package:pokedex/features/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImple extends PokemonRepository {
  final PokemonRemoteData remoteData;
  final NetworkInfo networkInfo;

  PokemonRepositoryImple({required this.remoteData, required this.networkInfo});

  @override
  Future<Either<Failure, PokemonList>> getList(String? url) async {
    if (await networkInfo.isConnected) {
      try {
        final pokemons = await remoteData.getList(url);
        return Right(pokemons);
      } on ApiResponseException catch (m) {
        return Left(ApiResponseFailure(message: m.message));
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure(message: ex.toString()));
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
