import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/widgets/tab_header_widget.dart';
import 'package:pokedex/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokedex/features/pokemon/domain/entities/types.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/detail/about_widget.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/detail/forms_widget.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/detail/moves_widget.dart';
import 'package:pokedex/features/pokemon/presentation/widgets/detail/stats_widget.dart';

class PokemonDetailWidget extends StatefulWidget {
  final PokemonDetail detail;
  const PokemonDetailWidget({Key? key, required this.detail}) : super(key: key);

  @override
  State<PokemonDetailWidget> createState() => _PokemonDetailWidgetState();
}

class _PokemonDetailWidgetState extends State<PokemonDetailWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final double realHeigth;
  late final double realWeigth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    realHeigth = (widget.detail.height ?? 1) / 10.0;
    realWeigth = (widget.detail.weight ?? 1) / 10.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig().vPadding,
              horizontal: SizeConfig().hPadding),
          child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: TypesColors.getColor(widget.detail.types[0])),
              labelColor: Colors.white,
              unselectedLabelColor: Theme.of(context).primaryColor,
              labelPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig().vPadding, horizontal: 0),
              tabs: const [
                TabHeaderWidget(title: 'About'),
                TabHeaderWidget(
                  title: 'Stats',
                ),
                TabHeaderWidget(title: 'Forms'),
                TabHeaderWidget(title: 'Moves')
              ]),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              AboutWidget(detail: widget.detail),
              StatsWidget(
                  stats: widget.detail.stats!,
                  color: TypesColors.getColor(
                    widget.detail.types[0],
                  )),
              FormsWidget(sprites: widget.detail.sprites!),
              MovesWidget(
                  moves: widget.detail.moves!,
                  color: TypesColors.getColor(
                    widget.detail.types[0],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
