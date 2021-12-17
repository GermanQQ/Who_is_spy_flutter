import 'package:flutter/material.dart';

bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

bool isTablet(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide > 600;
}

bool isSmallDevice(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide < 330;
}

Size getSizeByOrentation(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return isLandscape(context) ? Size(size.height, size.width) : size;
}

double getFontSizeByScreen(BuildContext context, double fontSize) {
  double tabletHeightValue = getSizeByOrentation(context).height * 0.00115;
  double smallHeightValue = getSizeByOrentation(context).height * 0.0014;

  if (isTablet(context)) {
    return tabletHeightValue * fontSize;
  }
  if (isSmallDevice(context)) {
    return smallHeightValue * fontSize;
  } else {
    return fontSize;
  }
}
