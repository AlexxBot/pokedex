import 'package:flutter/material.dart';
import 'package:pokedex/core/widgets/text_widget.dart';

class ChipWidget extends StatelessWidget {
  final Color? color;
  final double fontSize;
  final String text;
  final double vPadding;
  final double hPadding;
  final Color? textColor;
  const ChipWidget(
      {Key? key,
      this.color,
      this.fontSize = 14,
      required this.text,
      this.vPadding = 5,
      this.hPadding = 6,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      margin:
          EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding / 2),
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      child: TextWidget(
        text,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
