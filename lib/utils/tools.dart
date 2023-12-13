import 'package:flutter/material.dart';

class AppColor {
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const background = Color.fromARGB(255, 241, 235, 223);
  static const primary = Color.fromARGB(163, 127, 86, 1);
  static const orange = Color.fromARGB(255, 196, 88, 41);
  static const green = Color.fromARGB(255, 3, 32, 14);
  static const textColor = Color.fromARGB(255, 3, 32, 14);
}

class Helper {
  static const PADDING = 50.0;

  static String getAssetName(String fileName) {
    return "assets/images/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}

class AppTextStyle {
  static const TextStyle titleLarge = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      letterSpacing: 4,
      fontFamily: "Tenor Sans");

  static const TextStyle subtitle = TextStyle(fontSize: 25);
  static const TextStyle titleMedium =
      TextStyle(fontSize: 35, letterSpacing: 3);
  static const TextStyle menuButtonText =
      TextStyle(fontSize: 23, letterSpacing: 0.3);
  static const TextStyle menuButtonTextSelected =
      TextStyle(fontSize: 23, fontWeight: FontWeight.bold, letterSpacing: 1);
  static const TextStyle titleSmall =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle body = TextStyle(fontSize: 20, letterSpacing: 3);
  static const TextStyle bodygrasitalic = TextStyle(
      fontSize: 20,
      letterSpacing: 3,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  static const TextStyle textsub = TextStyle(
      fontSize: 20,
      letterSpacing: 3,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      decorationColor: AppColor.orange,
      decorationThickness: 0.8);
}
