import 'package:flutter/material.dart';
import 'package:who_is_spy_flutter/untils/size_untils.dart';

TextStyle buttonTextStyle(BuildContext context, {Color color = Colors.white, double fontSize = 20}) =>
    TextStyle(fontSize: getFontSizeByScreen(context, fontSize), color: color);

TextStyle titleTextStyle(BuildContext context, {Color color = Colors.white, double fontSize = 22}) =>
    TextStyle(fontSize: getFontSizeByScreen(context, fontSize), color: color);

TextStyle normalTextStyle(BuildContext context, {Color color = Colors.white, double fontSize = 18}) =>
    TextStyle(fontSize: getFontSizeByScreen(context, fontSize), color: color);

ButtonStyle textButton({Color primary = Colors.deepPurple}) => ElevatedButton.styleFrom(primary: primary, elevation: 5);
