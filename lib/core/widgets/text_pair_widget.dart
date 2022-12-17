import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';
import 'package:pokedex/core/config/theme.dart';
import 'package:pokedex/core/widgets/text_widget.dart';

class TextPairWidget extends StatelessWidget {
  final String name;
  final String value;
  final TextAlign? valueTextAlign;
  const TextPairWidget(
      {Key? key, required this.name, required this.value, this.valueTextAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 4 * SizeConfig().hPadding,
          right: 0,
          bottom: 4 * SizeConfig().vPadding,
          top: 4 * SizeConfig().vPadding),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextWidget(name, style: AppTheme.bigTextStyle),
          ),
          Expanded(
              flex: 3, child: TextWidget(value, style: AppTheme.bigTextStyle)),
        ],
      ),
    );
  }
}
