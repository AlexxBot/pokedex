import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/image_widget.dart';
import 'package:pokedex/core/widgets/text_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/sprites.dart';

class FormsWidget extends StatelessWidget {
  final Sprites sprites;
  const FormsWidget({Key? key, required this.sprites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig().vPadding,
            horizontal: 4 * SizeConfig().hPadding),
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 4 * SizeConfig().vPadding,
                  left: 2 * SizeConfig().hPadding),
              child: TextWidget(
                'Default',
                color: Colors.black,
                style: AppTheme.subTitleTextStyle,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontDefault,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backDefault,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontShiny,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backShiny,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 4 * SizeConfig().vPadding,
                  left: 2 * SizeConfig().hPadding),
              child: TextWidget(
                'Female',
                color: Colors.black,
                style: AppTheme.subTitleTextStyle,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontFemale,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backFemale,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.frontShinyFemale,
                  ),
                ),
                Expanded(
                  child: ImageWidget(
                    height: 150,
                    width: 150,
                    imageUrl: sprites.backShinyFemale,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
