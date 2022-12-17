import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/text_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokemon/domain/entities/types.dart';
import 'package:pokedex/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/pokemon_detail_widget.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/pokemon_portrait.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonDetail detail;
  const PokemonDetailPage({Key? key, required this.detail}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late final PokemonBloc pokemonBloc;
  late PokemonDetail pokemon;

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    pokemon = PokemonDetail(name: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: TypesColors.getColor(widget.detail.types[0]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PokemonPortratWidget(detail: widget.detail),
              Expanded(
                child: PokemonDetailWidget(
                  detail: widget.detail,
                ),
              )
            ],
          )),
    ));
  }
}
