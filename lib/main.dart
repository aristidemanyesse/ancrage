import 'package:ancrage/pages/ComingSoon.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "L'ANCRAGE",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.wihite),
        useMaterial3: true,
      ),
      home: const ComingSoon(
          title: "L'ANCRAGE - Votre premier ecolodge de luxe "),
    );
  }
}
