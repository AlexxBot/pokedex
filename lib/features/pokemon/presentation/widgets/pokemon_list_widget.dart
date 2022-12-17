import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/pokemon_item.dart';

class PokemonListWidget extends StatelessWidget {
  final List<Pokemon> list;
  final ScrollController controller;
  final int maxCount;
  final VoidCallback? getMoreData;
  const PokemonListWidget(
      {Key? key,
      required this.list,
      required this.controller,
      required this.maxCount,
      this.getMoreData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
          controller: controller,
          addAutomaticKeepAlives: true,
          cacheExtent: 100,
          shrinkWrap: true,
          padding: EdgeInsets.only(
              top: SizeConfig().vPadding, bottom: SizeConfig().vPadding),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: SizeConfig.screenWidth * 3 / 8,
              maxCrossAxisExtent: SizeConfig.screenWidth / 2,
              //childAspectRatio: 5 / 3,
              crossAxisSpacing: /* SizeConfig().vPadding */ 0,
              mainAxisSpacing: SizeConfig().hPadding),
          itemCount: list.length < maxCount ? list.length + 1 : list.length,
          itemBuilder: (BuildContext ctx, index) {
            if (index == list.length) {
              return const CupertinoActivityIndicator();
            }
            return Center(
              child: PokemonItemWidget(
                pokemon: list[index],
              ),
            );
          }),
    );
  }
}
