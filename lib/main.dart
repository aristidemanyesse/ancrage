import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/pages/apropos.dart';
import 'package:ancrage/pages/contacts.dart';
import 'package:ancrage/pages/galerie.dart';
import 'package:ancrage/pages/index.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
import 'package:ancrage/pages/reservation.dart';
import 'package:ancrage/pages/reservation_step2.dart';
import 'package:ancrage/pages/reservation_step3.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  Get.put(LoaderController());
  Get.put(PagesController());
  Get.put(ReservationController());
  Get.put(ReservationPageController());

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PagesController pagesController = Get.find();

    return GetMaterialApp(
      title: "L'ANCRAGE",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.background, primary: AppColor.orange),
        useMaterial3: true,
      ),
      home: const IndexPage(),
      getPages: [
        GetPage(name: '/', page: () => const IndexPage()),
        GetPage(name: '/reservation', page: () => const ReservationPage()),
        GetPage(
            name: '/reservation_next_2',
            page: () => const ReservationStep2Page()),
        GetPage(
            name: '/reservation_next_3',
            page: () => const ReservationStep3Page()),
        GetPage(name: '/activites', page: () => const ReservationPage()),
        GetPage(name: '/galerie', page: () => const GaleriePage()),
        GetPage(name: '/a_propos', page: () => const AproposPage()),
        GetPage(name: '/contacts', page: () => const ContactsPage()),
      ],
    );
  }
}
