import 'package:flutter/material.dart';

class AppColor {
  static const wihite = Color.fromARGB(255, 255, 255, 255);
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
