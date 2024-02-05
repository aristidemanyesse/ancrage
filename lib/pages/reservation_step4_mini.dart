import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/assistance_bloc.dart';
import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/controllers/optionController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/components/form_user_reservation.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReservationStep4PageMini extends StatefulWidget {
  const ReservationStep4PageMini({super.key});

  @override
  State<ReservationStep4PageMini> createState() =>
      _ReservationStep4PageMiniState();
}

class _ReservationStep4PageMiniState extends State<ReservationStep4PageMini> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();
  ReservationController reservationController = Get.find();
  OptionController optionController = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  DateFormat dateFormat1 = DateFormat('E dd MMM yyyy à kk:mm');
  DateFormat dateFormat2 = DateFormat('E dd MMM yyyy');

  final Map<GlobalKey<AdvanceExpansionTileState>, bool> listKey = {};
  final int _selectedItem = 0;

  @override
  void initState() {
    super.initState();

    nameController.text = reservationController.client["name"] ?? "";
    emailController.text = reservationController.client["email"] ?? "";
    telController.text = reservationController.client["contact"] ?? "";

    int i = 0;
    while (i < 3) {
      listKey[GlobalKey<AdvanceExpansionTileState>()] = false;
      i += 1;
    }

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
                "assets/images/bg/IMG_7053@2x _dr.png",
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
                  SizedBox(
                    width: Get.size.width,
                    height: Get.size.height * 0.55,
                  ),
                  Container(
                    height: 900,
                    width: Get.size.width,
                    color: AppColor.background,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Helper.PADDING / 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          "réservation".toUpperCase(),
                          style: AppTextStyle.titleLarge.copyWith(
                              fontSize: 35,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/socials/Times@2x.png",
                              height: 30,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 3,
                            ),
                            Text(
                              "L'ANCRAGE \nest disponible en permanence pour vous.",
                              style: AppTextStyle.bodysmall,
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/socials/Phone@2x.png",
                              height: 30,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 3,
                            ),
                            Text(
                              "+225 07 07 070 707",
                              style: AppTextStyle.bodysmall,
                            )
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/socials/Email.svg",
                              height: 25,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 3,
                            ),
                            Text(
                              "contacts@ancrage.com",
                              style: AppTextStyle.bodysmall,
                            )
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              reservationController.packSelected.value.name,
                              style: AppTextStyle.subtitle,
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 5,
                            ),
                            Text(
                              "Durée de votre séjour",
                              style: AppTextStyle.bodysmall,
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 3,
                            ),
                            Responsive(
                              mobile: Column(
                                children: [
                                  Text(
                                    dateFormat2.format(
                                        reservationController.debut.value),
                                    style: AppTextStyle.body.copyWith(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0),
                                  ),
                                  Text(
                                    dateFormat2.format(
                                        reservationController.fin.value),
                                    style: AppTextStyle.body.copyWith(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0),
                                  ),
                                ],
                              ),
                              desktop: Text(
                                "${dateFormat2.format(reservationController.debut.value)} - ${dateFormat2.format(reservationController.fin.value)}",
                                style: AppTextStyle.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0),
                              ),
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Center(
                              child: Container(
                                height: 1,
                                width: Get.size.width / 3,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Votre activité",
                                    style: AppTextStyle.bodysmall,
                                  ),
                                  Text(
                                    reservationController
                                        .activitySelected.value.name,
                                    style: AppTextStyle.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Center(
                              child: Container(
                                height: 1,
                                width: Get.size.width / 3,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Infos supplémentaires",
                                    style: AppTextStyle.bodysmall,
                                  ),
                                  Text(
                                    "Confort et Santé",
                                    style: AppTextStyle.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Center(
                              child: Container(
                                height: 1,
                                width: Get.size.width / 3,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Montant total de votre séjour",
                                    style: AppTextStyle.bodysmall,
                                  ),
                                  Text(
                                    "${reservationController.montant} FCFA",
                                    style: AppTextStyle.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const AssistanceBloc(),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Helper.PADDING / 2,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/bg/facade.png",
                                    fit: BoxFit.fitHeight,
                                  ),
                                  const SizedBox(
                                    height: Helper.PADDING / 2,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1 -${reservationController.packSelected.value.name}",
                                          style: AppTextStyle.titleMedium,
                                        ),
                                        Text(
                                            "${reservationController.packSelected.value.nbreLit} lits | ${reservationController.packSelected.value.modeleLit} | ${reservationController.packSelected.value.superficie} m²",
                                            style: AppTextStyle.body
                                                .copyWith(letterSpacing: -1)),
                                        const SizedBox(
                                            height: Helper.PADDING / 4),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Arrivée",
                                                  style: AppTextStyle.small,
                                                ),
                                                const SizedBox(
                                                  width: Helper.PADDING / 5,
                                                ),
                                                Text(
                                                  dateFormat1.format(
                                                      reservationController
                                                          .debut.value),
                                                  style: AppTextStyle.bodysmall
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                                height: Helper.PADDING / 4),
                                            Row(
                                              children: [
                                                Text(
                                                  "Départ",
                                                  style: AppTextStyle.small,
                                                ),
                                                const SizedBox(
                                                  width: Helper.PADDING / 5,
                                                ),
                                                Text(
                                                  dateFormat1.format(
                                                      reservationController
                                                          .fin.value),
                                                  style: AppTextStyle.bodysmall
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                            height: Helper.PADDING / 4),
                                        InderlineButton2(
                                          onTap: () {},
                                          title: "Détails de la chambre",
                                        ),
                                        const SizedBox(
                                            height: Helper.PADDING / 4),
                                        Text(
                                            "${reservationController.nbrPersonne} personnes    ${reservationController.nbrChambre} chambre",
                                            style: AppTextStyle.bodysmall
                                                .copyWith(letterSpacing: -1)),
                                        if (reservationController
                                                .activitySelected.value.id !=
                                            "")
                                          Column(
                                            children: [
                                              const SizedBox(
                                                  height: Helper.PADDING / 2),
                                              Text(
                                                "Activité : ${reservationController.activitySelected.value.name}",
                                                style: AppTextStyle.titleSmall
                                                    .copyWith(fontSize: 20),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                            height: Helper.PADDING / 2),
                                        Text(
                                          "Confort défini",
                                          style: AppTextStyle.titleSmall
                                              .copyWith(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(
                                        Helper.PADDING / 2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InderlineButton2(
                                          onTap: () {
                                            Get.back();
                                          },
                                          title: "Modifier",
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.all(Helper.PADDING / 2),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: Helper.PADDING / 2),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.background, width: 3)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Informations personnelles",
                                      style: AppTextStyle.titleSmall
                                          .copyWith(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: Helper.PADDING / 2,
                                    ),
                                    const FormUserReservation(),
                                    const SizedBox(
                                      height: Helper.PADDING / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FormMainButton(
                                          onTap: () {
                                            reservationController.save();
                                          },
                                          title: Text(
                                            "Valider la reservation",
                                            style: AppTextStyle.menuButtonText
                                                .copyWith(
                                                    color: AppColor.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Helper.PADDING,
                        ),
                        // const ComeToUs(
                        //   start: 3000,
                        // ),
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
