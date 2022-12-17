import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex/injections.dart';
import 'package:pokedex/pokedex_app.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonBloc>(),
      child: PokedexApp(),
    );
  }
}
