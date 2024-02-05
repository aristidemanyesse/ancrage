import 'package:ancrage/components/affiche_reservation.dart';
import 'package:ancrage/components/affiche_reservation_mini.dart';
import 'package:ancrage/components/bloc_form_reservation.dart';
import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/components/pack_box_mini.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/components/pack_box.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/components/bloc_view_reservation.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:collection/collection.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();

  ReservationController reservationController = Get.find();

  TextEditingController debutController = TextEditingController();
  TextEditingController finController = TextEditingController();
  TextEditingController nbrPersonneController =
      TextEditingController(text: "1");
  TextEditingController nbrChambreController = TextEditingController(text: "1");
  DateFormat dateFormat = DateFormat('dd MMMM yyy – kk:mm');
  DateFormat dateFormat2 = DateFormat('E dd MMM yyyy à kk:mm');

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = "fr_FR";
    Jiffy.setLocale('fr_FR');

    debutController.text = dateFormat.format(reservationController.debut.value);
    finController.text = dateFormat.format(reservationController.fin.value);

    _scrollController.addListener(() {
      pageController.scrollPosition.value = _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            child: Responsive(
              desktop: Image.asset(
                "assets/images/bg/IMG_7053@2x.png",
                fit: BoxFit.scaleDown,
              ),
              tablet: Image.asset(
                "assets/images/bg/IMG_7053@2x.png",
                fit: BoxFit.fitHeight,
              ),
              mobile: Image.asset(
                "assets/images/bg/IMG_7053@3x.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    width: Get.size.width,
                    height: Get.size.height * 0.55,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.white, width: 0))),
                    child: (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
                        ? Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                width: Get.size.width,
                                height: 30,
                                color: Colors.white,
                              ),
                              const AfficheReservation(),
                            ],
                          )
                        : Container(),
                  ),
                  if (Responsive.isMobileLarge(context) ||
                      Responsive.isMobile(context))
                    const AfficheReservationMini(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMonitor(context)
                            ? Helper.PADDING * 2
                            : 0),
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                            top: BorderSide(color: Colors.white, width: 0))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Helper.PADDING,
                          ),
                          child: Responsive(
                            mobile: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          (Responsive.isMobileLarge(context) ||
                                                  Responsive.isMobile(context))
                                              ? Helper.PADDING / 2
                                              : Helper.PADDING),
                                  child: BlocFormReservation(
                                    reservationController:
                                        reservationController,
                                    debutController: debutController,
                                    finController: finController,
                                    nbrChambreController: nbrChambreController,
                                    nbrPersonneController:
                                        nbrPersonneController,
                                  ),
                                ),
                                SizedBox(
                                  height: (Responsive.isMobileLarge(context) ||
                                          Responsive.isMobile(context))
                                      ? Helper.PADDING / 3
                                      : Helper.PADDING,
                                ),
                                BlocViewReservation(
                                    reservationController:
                                        reservationController,
                                    dateFormat2: dateFormat2),
                              ],
                            ),
                            desktop: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING * 3),
                                  child: BlocFormReservation(
                                    reservationController:
                                        reservationController,
                                    debutController: debutController,
                                    finController: finController,
                                    nbrChambreController: nbrChambreController,
                                    nbrPersonneController:
                                        nbrPersonneController,
                                  ),
                                ),
                                const SizedBox(
                                  height: Helper.PADDING,
                                ),
                                BlocViewReservation(
                                    reservationController:
                                        reservationController,
                                    dateFormat2: dateFormat2),
                              ],
                            ),
                            monitor: Row(
                              children: [
                                Expanded(
                                    child: BlocFormReservation(
                                  reservationController: reservationController,
                                  debutController: debutController,
                                  finController: finController,
                                  nbrChambreController: nbrChambreController,
                                  nbrPersonneController: nbrPersonneController,
                                )),
                                const SizedBox(
                                  width: Helper.PADDING,
                                ),
                                Expanded(
                                  child: BlocViewReservation(
                                      reservationController:
                                          reservationController,
                                      dateFormat2: dateFormat2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0,
                              vertical: (Responsive.isMobileLarge(context) ||
                                      Responsive.isMobile(context))
                                  ? 0
                                  : Helper.PADDING),
                          decoration: BoxDecoration(
                              border: (Responsive.isMobileLarge(context) ||
                                      Responsive.isMobile(context))
                                  ? null
                                  : Border.all(
                                      width: 3, color: AppColor.background)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  (Responsive.isMobileLarge(context) ||
                                          Responsive.isMobile(context))
                                      ? "Votre package"
                                      : "Sélection de votre package",
                                  style: (Responsive.isMobileLarge(context) ||
                                          Responsive.isMobile(context))
                                      ? AppTextStyle.titleLarge
                                      : AppTextStyle.titleMedium,
                                ),
                              ),
                              const SizedBox(
                                height: Helper.PADDING,
                              ),
                              Container(
                                  child: Column(
                                children: reservationController.listKey.keys
                                    .mapIndexed((index, key) => Container(
                                          margin: EdgeInsets.only(
                                              bottom: (Responsive.isMobileLarge(
                                                          context) ||
                                                      Responsive.isMobile(
                                                          context))
                                                  ? Helper.PADDING / 4
                                                  : Helper.PADDING / 2),
                                          child: Responsive(
                                              mobile: PackBoxMini(
                                                key_value: key,
                                                pack: reservationController
                                                    .listKey[key]!,
                                                initiallyExpanded:
                                                    reservationController
                                                            .packSelected
                                                            .value
                                                            .id ==
                                                        reservationController
                                                            .listKey[key]!.id,
                                              ),
                                              desktop: PackBox(
                                                key_value: key,
                                                pack: reservationController
                                                    .listKey[key]!,
                                                initiallyExpanded:
                                                    reservationController
                                                            .packSelected
                                                            .value
                                                            .id ==
                                                        reservationController
                                                            .listKey[key]!.id,
                                              )),
                                        ))
                                    .toList(),
                              )),
                            ],
                          ),
                        )),
                        // const ComeToUs(
                        //   start: 1200,
                        // ),
                        if (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
                          const SizedBox(
                            height: Helper.PADDING * 2,
                          ),
                      ],
                    ),
                  ),
                  const Footer()
                ],
              ),
            ),
          ),
          const Responsive(
            mobile: HeaderMenuMini(),
            mobileLarge: HeaderMenuMini(),
            tablet: HeaderMenuMini(),
            desktop: HeaderMenu(),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
