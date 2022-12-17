import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/widgets/chip_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/move.dart';

class MovesWidget extends StatelessWidget {
  final List<Move> moves;
  final Color? color;
  const MovesWidget({Key? key, required this.moves, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig().vPadding, horizontal: SizeConfig().hPadding),
      color: Colors.white,
      child: ListView(
        children: [
          Wrap(
            children: moves
                .map<ChipWidget>((move) => ChipWidget(
                      hPadding: 2 * SizeConfig().hPadding,
                      vPadding: 2 * SizeConfig().vPadding,
                      text: move.name ?? '',
                      fontSize: SizeConfig().fontbigSize,
                      color: color,
                      textColor: Theme.of(context).primaryColor,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
