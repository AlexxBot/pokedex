part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class LoadingState extends PokemonState {}

class PokemonListedState extends PokemonState {
  final PokemonList pokemonList;
  const PokemonListedState({required this.pokemonList});
}

class ErrorState extends PokemonState {
  final String message;
  const ErrorState({required this.message});
}
