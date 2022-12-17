import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:pokedex/features/pokemon/domain/usecases/pokemon_use_case.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonUseCase useCase;
  PokemonBloc({required this.useCase}) : super(PokemonInitial()) {
    on<GetPokemonListEvent>(_getPokemonList);
  }

  Future<void> _getPokemonList(
      GetPokemonListEvent event, Emitter<PokemonState> emit) async {
    emit(LoadingState());
    final response = await useCase.getList(event.url);
    response.fold((failure) => emit(ErrorState(message: failure.message)),
        (pokemonList) => emit(PokemonListedState(pokemonList: pokemonList)));
  }
}
