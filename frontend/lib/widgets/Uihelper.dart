import 'package:flutter/material.dart';
import 'package:frontend/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Uihelper {
  static customImg({
    required String img,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return Image.asset(
      'assets/images/$img',
      height: height,
      width: width,
      fit: fit,
    );
  }

  static customTxt({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }

  static ThemeData theme (BuildContext context) {
    return Provider.of<ThemeProvider>(context).themeData;
  }
}
