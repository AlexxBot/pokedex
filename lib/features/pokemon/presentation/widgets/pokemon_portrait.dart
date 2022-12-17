import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/chip_widget.dart';
import 'package:pokedex/core/widgets/svg_widget.dart';
import 'package:pokedex/core/widgets/text_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokemon/domain/entities/types.dart';

class PokemonPortratWidget extends StatelessWidget {
  final PokemonDetail detail;
  const PokemonPortratWidget({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.1,
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/pok.png'),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig().vPadding,
              horizontal: SizeConfig().hPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      onPressed: (() => Navigator.pop(context)))),
              Wrap(
                  children: detail.types
                      .map<ChipWidget>((type) => ChipWidget(
                            text: type,
                            fontSize: SizeConfig().fontSubtitleSize,
                            color: TypesColors.getColor(detail.types[0]),
                            vPadding: 3 * SizeConfig().vPadding,
                            hPadding: 3 * SizeConfig().hPadding,
                            textColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ))
                      .toList()),
            ],
          ),
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: 'pokemon',
                child: SvgWidget(
                    height: MediaQuery.of(context).size.width - 130,
                    imageUrl: detail.sprites!.dreamWorld!),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 4 * SizeConfig().vPadding,
              horizontal: SizeConfig().hPadding),
          child: TextWidget(
            '${detail.name[0].toUpperCase()}${detail.name.substring(1)}',
            style: AppTheme.titleTextStyle.override(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: SizeConfig().fontTitleSize * 1.4),
          ),
        ),
      ]),
    );
  }
}
