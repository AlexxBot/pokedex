import 'package:flutter/material.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static Orientation? orientation;

  bool get isMobile => screenWidth < 650;
  bool get isTablet => screenWidth > 650 && screenWidth <= 1024;
  bool get isDesktop => screenWidth > 1024;

  double get hPadding => isMobile ? fontSize * 0.2 : fontSize * 0.2;
  double get vPadding => isMobile ? fontSize * 0.2 : fontSize * 0.2;
  double get radius => fontSize * 1.2;

  double get fontSize => isMobile
      ? 14
      : isTablet
          ? 15
          : 16;

  double get fontTitleSize => isMobile ? 1.5 * fontSize : 1.5 * fontSize;

  double get fontSubtitleSize => isMobile ? 1.2 * fontSize : 1.2 * fontSize;

  double get fontbigSize => isMobile ? 1.1 * fontSize : 1.1 * fontSize;

  void init(BoxConstraints constraints, Orientation orientation) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
  }

  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._internal();
}
