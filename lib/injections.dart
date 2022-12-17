import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as client;
import 'package:pokedex/core/network/headers.dart';
import 'package:pokedex/core/network/network_info.dart';
import 'package:pokedex/features/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:pokedex/features/pokemon/data/repository/pokemon_repository_imple.dart';
import 'package:pokedex/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokedex/features/pokemon/domain/usecases/pokemon_use_case.dart';
import 'package:pokedex/features/pokemon/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PokemonBloc(useCase: sl()));

  sl.registerLazySingleton(() => PokemonUseCase(repository: sl()));

  sl.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImple(remoteData: sl(), networkInfo: sl()));

  sl.registerLazySingleton<PokemonRemoteData>(
      () => PokemonRemoteDataImple(client: sl()));

  sl.registerLazySingleton(() => Headers());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl(), 'https://pokeapi.co/api/v2/pokemon'));

  sl.registerLazySingleton(() => client.Client());
  sl.registerLazySingleton(() => Connectivity());
}
