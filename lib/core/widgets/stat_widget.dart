import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/text_widget.dart';

class StatWidget extends StatelessWidget {
  final int min;
  final int max;
  final String name;
  final double value;
  final Color? color;
  const StatWidget(
      {Key? key,
      this.min = 0,
      this.max = 200,
      required this.name,
      required this.value,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 2 * SizeConfig().vPadding, right: 2 * SizeConfig().hPadding),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextWidget(
              name,
              color: Theme.of(context).primaryColor,
              style: AppTheme.bigTextStyle,
            ),
          ),
          Expanded(
              child: TextWidget(
            value.toStringAsFixed(0),
            color: Theme.of(context).primaryColor,
            style: AppTheme.bigTextStyle,
          )),
          Expanded(
            flex: 5,
            child: Slider(
                inactiveColor: Theme.of(context).primaryColor.withOpacity(0.7),
                activeColor: color,
                min: min * 1.0,
                max: max * 1.0,
                value: value,
                onChanged: (value) => {}),
          )
        ],
      ),
    );
  }
}
