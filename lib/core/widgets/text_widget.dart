import 'package:flutter/material.dart';
import 'package:pokedex/core/config/theme.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  const TextWidget(this.text,
      {super.key,
      this.style,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.fontFamily,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //textScaleFactor: 2,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
      style: style ??
          AppTheme.normalTextStyle.override(

              //letterSpacing: SizeConfig().hPadding,
              lineHeight: 1.3,
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
              fontFamily: fontFamily),
    );
  }
}
