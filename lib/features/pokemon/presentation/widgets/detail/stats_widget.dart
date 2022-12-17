import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/widgets/stat_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/stat.dart';

class StatsWidget extends StatelessWidget {
  final Color? color;
  final List<Stat> stats;
  const StatsWidget({Key? key, required this.stats, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 2 * SizeConfig().vPadding, left: 4 * SizeConfig().hPadding),
      color: Colors.white,
      child: ListView(
        children: stats.map<StatWidget>((stat) {
          final doubleValue = stat.baseStat! * 1.0;
          return StatWidget(
              name: stat.nameStat, value: doubleValue, color: color);
        }).toList(),
      ),
    );
  }
}
