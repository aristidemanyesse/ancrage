import 'package:flutter/material.dart';

class AppColor {
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const background = Color.fromARGB(255, 241, 235, 223);
  static const primary = Color.fromARGB(163, 127, 86, 1);
  static const orange = Color.fromARGB(255, 196, 88, 41);
  static const green = Color.fromARGB(255, 3, 32, 14);
  static const blue = Color.fromARGB(255, 7, 65, 87);
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
  static const TextStyle contralto = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      letterSpacing: 4,
      fontFamily: "Contralto");

  static const TextStyle baseTenorSans =
      TextStyle(fontFamily: "Tenor Sans", letterSpacing: -1);

  static TextStyle titleLarge = baseTenorSans.copyWith(
    fontSize: 50,
    letterSpacing: 0,
  );

  static TextStyle subtitle = baseTenorSans.copyWith(
      fontSize: 21, letterSpacing: 0, fontWeight: FontWeight.w600);

  static TextStyle titleMedium =
      baseTenorSans.copyWith(fontSize: 35, letterSpacing: 3);

  static const TextStyle menuButtonText = TextStyle(
      fontSize: 20, fontFamily: "Tenor Sans", fontWeight: FontWeight.w500);

  static TextStyle menuButtonTextSelected =
      menuButtonText.copyWith(fontWeight: FontWeight.bold);
  static const TextStyle titleSmall =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle body =
      baseTenorSans.copyWith(fontSize: 20, letterSpacing: 3);

  static TextStyle bodygrasitalic = baseTenorSans.copyWith(
      fontSize: 20,
      letterSpacing: 3,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  static TextStyle textsub = baseTenorSans.copyWith(
      fontSize: 21,
      letterSpacing: 2,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);
}
