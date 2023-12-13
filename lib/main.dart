import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/pages/index.dart';
import 'package:ancrage/controllers/index_page_controller.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
import 'package:ancrage/pages/test.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  Get.put(LoaderController());
  Get.put(IndexPageController());
  Get.put(ReservationPageController());

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "L'ANCRAGE",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.background, primary: Colors.white),
        useMaterial3: true,
      ),
      home: IndexPage(),
    );
  }
}
