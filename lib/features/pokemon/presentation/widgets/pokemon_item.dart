import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokedex/core/config/router.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/chip_widget.dart';
import 'package:pokedex/core/widgets/svg_widget.dart';
import 'package:pokedex/core/widgets/text_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokemon/domain/entities/types.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItemWidget({Key? key, required this.pokemon}) : super(key: key);

  Future<void> _showDetail(BuildContext context) async {
    Navigator.pushNamed(context, RouteGenerator.pokemonDetailPage,
        arguments: pokemon.detail!);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.5;
    return InkWell(
        onTap: () => _showDetail(context),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(
              top: SizeConfig().vPadding,
              bottom: SizeConfig().vPadding,
              left: 2 * SizeConfig().hPadding,
              right: 2 * SizeConfig().hPadding),
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig().vPadding,
              horizontal: SizeConfig().hPadding),
          decoration: BoxDecoration(
              color: TypesColors.getColor(pokemon.detail!.types[0])
                  .withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Stack(children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig().vPadding,
                      horizontal: SizeConfig().hPadding),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.1,
                      //fit: BoxFit.cover,
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/pok.png'),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig().vPadding * 6,
                    left: SizeConfig().hPadding * 12),
                child: Hero(
                  tag: pokemon.name,
                  child: SvgWidget(
                    height: 150,
                    imageUrl: pokemon.detail!.sprites!.dreamWorld,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: TextWidget(
                pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                style: AppTheme.subTitleTextStyle
                    .override(color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.vertical,
                children: pokemon.detail!.types
                    .map<ChipWidget>((type) => ChipWidget(
                          text: type,
                          color: TypesColors.getColor(pokemon.detail!.types[0])
                              .withOpacity(1),
                          fontSize: 12,
                          textColor: Theme.of(context).scaffoldBackgroundColor,
                        ))
                    .toList(),
              ),
            )
          ]),
        ));
  }
}
