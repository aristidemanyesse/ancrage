import 'package:advance_expansion_tile/advance_expansion_tile.dart';
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

class ReservationStep4Page extends StatefulWidget {
  const ReservationStep4Page({super.key});

  @override
  State<ReservationStep4Page> createState() => _ReservationStep4PageState();
}

class _ReservationStep4PageState extends State<ReservationStep4Page> {
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
                              Container(
                                margin: const EdgeInsets.only(
                                    left: Helper.PADDING * 2),
                                padding:
                                    const EdgeInsets.all(Helper.PADDING / 1.5),
                                width: Get.size.width * 0.35,
                                height: 250,
                                color: AppColor.background,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "réservation".toUpperCase(),
                                      style: AppTextStyle.titleLarge.copyWith(
                                          fontSize: 38,
                                          letterSpacing: 5,
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
                                          "L'ANCRAGE est disponible en permanence pour vous.",
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
                                          "info@ancrage.com",
                                          style: AppTextStyle.bodysmall,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMonitor(context)
                            ? Helper.PADDING * 3
                            : Responsive.isDesktop(context) ||
                                    Responsive.isTablet(context)
                                ? Helper.PADDING
                                : 0),
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Helper.PADDING,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.background,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Helper.PADDING / 4,
                                      horizontal: Helper.PADDING),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            reservationController
                                                .packSelected.value.name,
                                            style: AppTextStyle.subtitle,
                                          ),
                                          const SizedBox(
                                            height: Helper.PADDING / 5,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Durée de votre séjour",
                                                      style: AppTextStyle.small,
                                                    ),
                                                    const SizedBox(
                                                      height:
                                                          Helper.PADDING / 5,
                                                    ),
                                                    Text(
                                                      "${dateFormat2.format(reservationController.debut.value)} - ${dateFormat2.format(reservationController.fin.value)}",
                                                      style: AppTextStyle
                                                          .bodysmall
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: Helper.PADDING,
                                                child: Center(
                                                    child: Container(
                                                  height: 40,
                                                  width: 1,
                                                  color: Colors.black,
                                                )),
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Montant total de votre séjour",
                                                      style: AppTextStyle.small,
                                                    ),
                                                    const SizedBox(
                                                      height:
                                                          Helper.PADDING / 5,
                                                    ),
                                                    Text(
                                                      "${reservationController.montant} FCFA",
                                                      style: AppTextStyle
                                                          .bodysmall
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/socials/Heure.svg",
                                                  height: 18,
                                                ),
                                                InderlineButton2(
                                                  onTap: () {},
                                                  title:
                                                      "Assistance en chambre disponible dès 08h30",
                                                ),
                                                // const SizedBox(
                                                //   width: Helper.PADDING / 4,
                                                // ),
                                                // FormMainButton(
                                                //     onTap: () {
                                                //       Get.dialog(
                                                //           const AlertModal());
                                                //     },
                                                //     title: "Continuer")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: AppColor.background)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                  Helper.PADDING / 2,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: Responsive.isMonitor(context)
                                            ? 3
                                            : 5,
                                        child: Image.asset(
                                          "assets/images/bg/facade.png",
                                          fit: BoxFit.fitHeight,
                                        )),
                                    const Responsive(
                                      mobile: SizedBox(
                                        width: Helper.PADDING,
                                      ),
                                      tablet: SizedBox(
                                        width: Helper.PADDING / 2,
                                      ),
                                      desktop: SizedBox(
                                        width: Helper.PADDING,
                                      ),
                                    ),
                                    Expanded(
                                      flex:
                                          Responsive.isMonitor(context) ? 4 : 3,
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Responsive(
                                                    mobile: const Text(""),
                                                    tablet: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "1 -${reservationController.packSelected.value.name}",
                                                          style: AppTextStyle
                                                              .titleMedium
                                                              .copyWith(
                                                                  fontSize: 28),
                                                        ),
                                                        Text(
                                                            "${reservationController.packSelected.value.nbreLit} lits | ${reservationController.packSelected.value.modeleLit} | ${reservationController.packSelected.value.superficie} m²",
                                                            style: AppTextStyle
                                                                .body
                                                                .copyWith(
                                                                    fontSize:
                                                                        15,
                                                                    letterSpacing:
                                                                        -1)),
                                                      ],
                                                    ),
                                                    desktop: Column(
                                                      children: [
                                                        Text(
                                                          "1 -${reservationController.packSelected.value.name}",
                                                          style: AppTextStyle
                                                              .titleMedium,
                                                        ),
                                                        Text(
                                                            "${reservationController.packSelected.value.nbreLit} lits | ${reservationController.packSelected.value.modeleLit} | ${reservationController.packSelected.value.superficie} m²",
                                                            style: AppTextStyle
                                                                .body
                                                                .copyWith(
                                                                    letterSpacing:
                                                                        -1)),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 4),
                                                  Responsive(
                                                    mobile: Container(),
                                                    tablet: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Arrivée",
                                                              style:
                                                                  AppTextStyle
                                                                      .small,
                                                            ),
                                                            const SizedBox(
                                                              width: Helper
                                                                      .PADDING /
                                                                  5,
                                                            ),
                                                            Text(
                                                              dateFormat1.format(
                                                                  reservationController
                                                                      .debut
                                                                      .value),
                                                              style:
                                                                  AppTextStyle
                                                                      .bodysmall
                                                                      .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height:
                                                                Helper.PADDING /
                                                                    4),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Départ",
                                                              style:
                                                                  AppTextStyle
                                                                      .small,
                                                            ),
                                                            const SizedBox(
                                                              width: Helper
                                                                      .PADDING /
                                                                  5,
                                                            ),
                                                            Text(
                                                              dateFormat1.format(
                                                                  reservationController
                                                                      .fin
                                                                      .value),
                                                              style:
                                                                  AppTextStyle
                                                                      .bodysmall
                                                                      .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    desktop: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Arrivée",
                                                              style:
                                                                  AppTextStyle
                                                                      .small,
                                                            ),
                                                            const SizedBox(
                                                              width: Helper
                                                                      .PADDING /
                                                                  5,
                                                            ),
                                                            Text(
                                                              dateFormat1.format(
                                                                  reservationController
                                                                      .debut
                                                                      .value),
                                                              style:
                                                                  AppTextStyle
                                                                      .bodysmall
                                                                      .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height:
                                                                Helper.PADDING /
                                                                    4),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "Départ",
                                                              style:
                                                                  AppTextStyle
                                                                      .small,
                                                            ),
                                                            const SizedBox(
                                                              width: Helper
                                                                      .PADDING /
                                                                  5,
                                                            ),
                                                            Text(
                                                              dateFormat1.format(
                                                                  reservationController
                                                                      .fin
                                                                      .value),
                                                              style:
                                                                  AppTextStyle
                                                                      .bodysmall
                                                                      .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    monitor: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Arrivée",
                                                          style: AppTextStyle
                                                              .small,
                                                        ),
                                                        const SizedBox(
                                                          width:
                                                              Helper.PADDING /
                                                                  5,
                                                        ),
                                                        Text(
                                                          dateFormat1.format(
                                                              reservationController
                                                                  .debut.value),
                                                          style: AppTextStyle
                                                              .bodysmall
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width:
                                                                Helper.PADDING),
                                                        Text(
                                                          "Départ",
                                                          style: AppTextStyle
                                                              .small,
                                                        ),
                                                        const SizedBox(
                                                          width:
                                                              Helper.PADDING /
                                                                  5,
                                                        ),
                                                        Text(
                                                          dateFormat1.format(
                                                              reservationController
                                                                  .fin.value),
                                                          style: AppTextStyle
                                                              .bodysmall
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 4),
                                                  InderlineButton2(
                                                    onTap: () {},
                                                    title:
                                                        "Détails de la chambre",
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 4),
                                                  Text(
                                                      "${reservationController.nbrPersonne} personnes    ${reservationController.nbrChambre} chambre",
                                                      style: AppTextStyle
                                                          .bodysmall
                                                          .copyWith(
                                                              letterSpacing:
                                                                  -1)),
                                                  if (reservationController
                                                          .activitySelected
                                                          .value
                                                          .id !=
                                                      "")
                                                    Column(
                                                      children: [
                                                        const SizedBox(
                                                            height:
                                                                Helper.PADDING /
                                                                    2),
                                                        Responsive(
                                                          mobile:
                                                              const Text(""),
                                                          tablet: Text(
                                                            "Activité : ${reservationController.activitySelected.value.name}",
                                                            style: AppTextStyle
                                                                .titleSmall
                                                                .copyWith(
                                                                    fontSize:
                                                                        20),
                                                          ),
                                                          desktop: Text(
                                                            "Activité : ${reservationController.activitySelected.value.name}",
                                                            style: AppTextStyle
                                                                .titleSmall,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 2),
                                                  Responsive(
                                                    mobile: const Text(""),
                                                    tablet: Text(
                                                      "Confort défini",
                                                      style: AppTextStyle
                                                          .titleSmall
                                                          .copyWith(
                                                              fontSize: 20),
                                                    ),
                                                    desktop: Text(
                                                      "Confort défini",
                                                      style: AppTextStyle
                                                          .titleSmall,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: Helper.PADDING),
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InderlineButton2(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      title: "Modifier",
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sélection de votre package",
                                      style: AppTextStyle.titleMedium,
                                    ),
                                    const SizedBox(
                                      height: Helper.PADDING / 2,
                                    ),
                                    const FormUserReservation(),
                                    const SizedBox(
                                      height: Helper.PADDING / 2,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FormMainButton(
                                            onTap: () {
                                              reservationController.save();
                                            },
                                            title: Text(
                                                "Valider la reservation",
                                                style: AppTextStyle
                                                    .menuButtonText
                                                    .copyWith(
                                                        color:
                                                            AppColor.white))),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Helper.PADDING * 2,
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
