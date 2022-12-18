import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/snack_widget.dart';
import 'package:pokedex/core/widgets/text_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_list.dart';
import 'package:pokedex/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/pokemon_list_widget.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  late final PokemonBloc pokemonBloc;
  late List<Pokemon> list;
  late PokemonList pokemonList;
  late int count;
  late String? url;
  late bool getAll;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pokemonBloc = BlocProvider.of<PokemonBloc>(context);
    list = [];
    count = 0;
    getAll = false;
    _reloadList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  Future<void> _reloadList() async {
    url = null;
    pokemonBloc.add(const GetPokemonListEvent());
  }

  Future<void> _getMoreData() async {
    if (url != null) {
      pokemonBloc.add(GetPokemonListEvent(url: url));
    }
  }

  void _getAllData() {
    getAll = true;
    pokemonBloc.add(GetPokemonListEvent(url: url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Image.asset('assets/images/pok.png'),
        title: TextWidget(
          'Pokedex',
          style: AppTheme.titleTextStyle,
        ),
      ),
      body: SafeArea(
          child: BlocConsumer<PokemonBloc, PokemonState>(
        bloc: pokemonBloc,
        listener: (context, state) {
          if (state is ErrorState) {
            SnackWidget.showMessage(context, 'All Pokemos were retrived');
          }
          if (state is PokemonListedState) {
            list.addAll(state.pokemonList.list);
            count = state.pokemonList.count;
            url = state.pokemonList.next;
            if (getAll && url != null) {
              _getAllData();
            } else {
              if (getAll) {
                SnackWidget.showMessage(context, 'All Pokemos were retrived');
              }
              getAll = false;
            }
          }
        },
        builder: (context, state) {
          if (state is LoadingState && url == null) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return /* RefreshIndicator(
              onRefresh: _reloadList,
              child:  */
              PokemonListWidget(
            list: list,
            controller: _scrollController,
            maxCount: count,
            getMoreData: _getMoreData,
          ) /* ) */;
        },
      )),
    );
  }
}
