import 'package:flutter/material.dart';

class AppColor {
  static const wihite = Color.fromRGBO(255, 255, 255, 1);
  static const background = Color.fromARGB(100, 99, 94, 90);
  static const primary = Color.fromARGB(163, 127, 86, 1);
}

class Helper {
  static const distance = 20.0;

  static String getAssetName(String fileName) {
    return "assets/images/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
