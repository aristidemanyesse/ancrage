import 'package:flutter/material.dart';

class AppColor {
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const background = Color.fromARGB(255, 241, 235, 223);
  static const primary = Color.fromARGB(163, 127, 86, 1);
  static const orange = Color.fromARGB(255, 196, 88, 41);
  static const green = Color.fromARGB(255, 3, 32, 14);
  static const grey = Color.fromARGB(100, 3, 32, 14);
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
  static const TextStyle baseTenorSans =
      TextStyle(fontFamily: "Tenor Sans", letterSpacing: -1);

  static TextStyle titleLarge = baseTenorSans.copyWith(
    fontSize: 50,
    letterSpacing: 0,
  );

  static TextStyle titleMedium =
      baseTenorSans.copyWith(fontSize: 35, letterSpacing: 3);

  static TextStyle titleSmall = baseTenorSans.copyWith(fontSize: 30);

  static TextStyle subtitle = baseTenorSans.copyWith(
      fontSize: 21, letterSpacing: 0, fontWeight: FontWeight.w600);

  static TextStyle body =
      baseTenorSans.copyWith(fontSize: 20, letterSpacing: 3);

  static TextStyle label = baseTenorSans.copyWith(
      fontSize: 17, letterSpacing: 1.5, fontWeight: FontWeight.bold);
  static TextStyle placeholder =
      baseTenorSans.copyWith(fontSize: 15, letterSpacing: -1);

  static TextStyle bodysmall = baseTenorSans.copyWith(
      fontSize: 14, letterSpacing: 0, fontWeight: FontWeight.w600);

  static TextStyle small = baseTenorSans.copyWith(
    fontSize: 11,
    letterSpacing: 0,
  );

  static TextStyle bodygrasitalic = baseTenorSans.copyWith(
      fontSize: 20,
      letterSpacing: 3,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  static TextStyle textsub = baseTenorSans.copyWith(
      fontSize: 20,
      letterSpacing: 1,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);

  static const TextStyle menuButtonText = TextStyle(
      fontSize: 20,
      fontFamily: "Contralto",
      letterSpacing: 1.5,
      fontWeight: FontWeight.w400);

  static TextStyle menuButtonTextSelected =
      menuButtonText.copyWith(fontWeight: FontWeight.bold);

  static const TextStyle playfair = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      letterSpacing: 4,
      fontFamily: "Playfair");

  static const TextStyle contralto = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      letterSpacing: 4,
      fontFamily: "Contralto");
}
