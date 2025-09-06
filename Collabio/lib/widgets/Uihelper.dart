import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  static profileIcons({required IconData icon}) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Color(0xFF2C5364),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, size: 24, color: Colors.white),
      ),
    );
  }

  static ThemeData theme(BuildContext context) {
    return Provider.of<ThemeProvider>(context).themeData;
  }
}
