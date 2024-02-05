import 'package:ancrage/controllers/ConnexionController.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/activityController.dart';
import 'package:ancrage/controllers/galerieController.dart';
import 'package:ancrage/controllers/optionController.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/core/TranslationClass.dart';
import 'package:ancrage/pages/activities.dart';
import 'package:ancrage/pages/activity.dart';
import 'package:ancrage/pages/apropos.dart';
import 'package:ancrage/pages/contacts.dart';
import 'package:ancrage/pages/galerie.dart';
import 'package:ancrage/pages/galeries.dart';
import 'package:ancrage/pages/index.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
import 'package:ancrage/pages/reservation.dart';
import 'package:ancrage/pages/reservation_step2.dart';
import 'package:ancrage/pages/reservation_step3.dart';
import 'package:ancrage/pages/reservation_step3_mini.dart';
import 'package:ancrage/pages/reservation_step4.dart';
import 'package:ancrage/pages/reservation_step4_mini.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  Get.put(ConnexionController());
  Get.put(LoaderController());
  Get.put(PagesController());
  Get.put(ReservationController());
  Get.put(ActivityController());
  Get.put(OptionController());
  Get.put(GalerieController());
  Get.put(ReservationPageController());

  initializeDateFormatting('fr_FR', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "L'ANCRAGE",
      debugShowCheckedModeBanner: false,
      translations: TranslationClass(), // your translations
      locale: Get
          .deviceLocale, //Locale('fr', 'Fr'), // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'UK'),
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
            page: () => const Responsive(
                mobile: ReservationStep3PageMini(),
                mobileLarge: ReservationStep3PageMini(),
                tablet: ReservationStep3Page(),
                desktop: ReservationStep3Page())),
        GetPage(
            name: '/reservation_next_4',
            page: () => const Responsive(
                mobile: ReservationStep4PageMini(),
                mobileLarge: ReservationStep4PageMini(),
                tablet: ReservationStep4Page(),
                desktop: ReservationStep4Page())),
        GetPage(name: '/activities', page: () => const ActivitiesPage()),
        GetPage(name: '/activity', page: () => const ActivityPage()),
        GetPage(name: '/galeries', page: () => const GaleriesPage()),
        GetPage(name: '/galerie', page: () => const GaleriePage()),
        GetPage(name: '/a_propos', page: () => const AproposPage()),
        GetPage(name: '/contacts', page: () => const ContactsPage()),
      ],
    );
  }
}
