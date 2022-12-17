import 'package:flutter/material.dart';
import 'package:pokedex/core/config/size_config.dart';

class AppTheme {
  final theme = ThemeData(
    fontFamily: 'montserrat',
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey[800],
    brightness: Brightness.light,
    errorColor: Colors.red[800],
    backgroundColor: /* ColorConst.containerBackGroundColor */ Colors.white,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: Colors.black12,
    appBarTheme: _appBarTheme,
  );

  static final _appBarTheme = AppBarTheme(
    centerTitle: true,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10),
      ),
    ),
    elevation: 5,
    titleTextStyle: AppTheme.titleTextStyle,

    backgroundColor: Colors.red[600], //Colors.white
  );

  static final normalTextStyle = TextStyle(
      //color: COLOR_CONST.textColor,
      fontFamily: 'montserrat',
      fontSize: SizeConfig().fontSize,
      height: 1.3);

  static final bigTextStyle = TextStyle(
      //color: COLOR_CONST.textColor,
      fontFamily: 'montserrat',
      fontSize: SizeConfig().fontbigSize,
      height: 1.3);

  static final subTitleTextStyle = TextStyle(
      //color: COLOR_CONST.textColor,
      fontFamily: 'montserrat',
      fontSize: SizeConfig().fontSubtitleSize,
      height: 1.1);

  static final titleTextStyle = TextStyle(
      //color: COLOR_CONST.textColor,
      fontFamily: 'montserrat',
      fontSize: SizeConfig().fontTitleSize,
      height: 1.1);

  /// Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? TextStyle(
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight /* ?? SizeConfig().lineHeight, */
              )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
