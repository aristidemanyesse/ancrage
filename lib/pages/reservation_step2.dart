import 'package:ancrage/components/affiche_reservation.dart';
import 'package:ancrage/components/assistance_bloc.dart';
import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/components/pack_box_activity.dart';
import 'package:ancrage/components/pack_box_activity_mini.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class ReservationStep2Page extends StatefulWidget {
  const ReservationStep2Page({super.key});

  @override
  State<ReservationStep2Page> createState() => _ReservationStep2PageState();
}

class _ReservationStep2PageState extends State<ReservationStep2Page> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();
  ReservationController reservationController = Get.find();

  DateFormat dateFormat1 = DateFormat('E dd MMM yyyy à kk:mm');
  DateFormat dateFormat2 = DateFormat('E dd MMM yyyy');

  @override
  void initState() {
    super.initState();

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
                              const AfficheReservation()
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
                        if (Responsive.isMobileLarge(context) ||
                            Responsive.isMobile(context))
                          Container(
                            height: Get.size.height * 0.9,
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
                                      fontSize: 38,
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
                                  flex: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      reservationController
                                          .packSelected.value.name,
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
                                                reservationController
                                                    .debut.value),
                                            style: AppTextStyle.body.copyWith(
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0),
                                          ),
                                          Text(
                                            dateFormat2.format(
                                                reservationController
                                                    .fin.value),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                        if (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Durée de votre séjour",
                                                        style:
                                                            AppTextStyle.small,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Montant total de votre séjour",
                                                        style:
                                                            AppTextStyle.small,
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
                                        const Expanded(child: AssistanceBloc()),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        Container(
                          decoration: BoxDecoration(
                            border: (!Responsive.isMobileLarge(context) &&
                                    !Responsive.isMobile(context))
                                ? Border.all(
                                    width: 3, color: AppColor.background)
                                : null,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Responsive(
                                mobile: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      ApiService.MEDIA_URL +
                                          reservationController
                                              .packSelected.value.image,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const SizedBox(
                                      height: Helper.PADDING / 2,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Helper.PADDING / 4,
                                      ),
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
                                                  Text(
                                                    "1 - ${reservationController.packSelected.value.name}",
                                                    style: AppTextStyle
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                      "${reservationController.packSelected.value.nbreLit} lits | ${reservationController.packSelected.value.modeleLit} | ${reservationController.packSelected.value.superficie} m²",
                                                      style: AppTextStyle.body
                                                          .copyWith(
                                                              letterSpacing:
                                                                  -1)),
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 4),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
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
                                                                    .debut
                                                                    .value),
                                                            style: AppTextStyle
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
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
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
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 4),
                                                  InderlineButton2(
                                                    onTap: () {},
                                                    title:
                                                        "Détails de la chambre",
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: Helper.PADDING * 3),
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
                                desktop: Container(
                                  padding: const EdgeInsets.all(
                                    Helper.PADDING / 4,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: Responsive.isMonitor(context)
                                              ? 3
                                              : 5,
                                          child: Image.network(
                                            ApiService.MEDIA_URL +
                                                reservationController
                                                    .packSelected.value.image,
                                            fit: BoxFit.fitHeight,
                                          )),
                                      const SizedBox(
                                        width: Helper.PADDING,
                                      ),
                                      Expanded(
                                        flex: Responsive.isMonitor(context)
                                            ? 4
                                            : 3,
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
                                                    Text(
                                                      "1 - ${reservationController.packSelected.value.name}",
                                                      style: AppTextStyle
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                        "${reservationController.packSelected.value.nbreLit} lits | ${reservationController.packSelected.value.modeleLit} | ${reservationController.packSelected.value.superficie} m²",
                                                        style: AppTextStyle.body
                                                            .copyWith(
                                                                letterSpacing:
                                                                    -1)),
                                                    const SizedBox(
                                                        height:
                                                            Helper.PADDING / 4),
                                                    Responsive(
                                                      mobile: Container(),
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
                                                                style: AppTextStyle
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
                                                              height: Helper
                                                                      .PADDING /
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
                                                                style: AppTextStyle
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
                                                                    .debut
                                                                    .value),
                                                            style: AppTextStyle
                                                                .bodysmall
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: Helper
                                                                  .PADDING),
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
                                                                  FontWeight
                                                                      .bold,
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                                height: Helper.PADDING * 3),
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
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Helper.PADDING / 2,
                                      horizontal: Helper.PADDING / 4),
                                  child: Center(
                                    child: Text(
                                      (Responsive.isMobileLarge(context) ||
                                              Responsive.isMobile(context))
                                          ? "Votre activité"
                                          : "Avons-nous pensé à tous ?",
                                      style:
                                          (Responsive.isMobileLarge(context) ||
                                                  Responsive.isMobile(context))
                                              ? AppTextStyle.titleLarge
                                              : AppTextStyle.titleMedium,
                                    ),
                                  )),
                              Container(
                                  child: Column(
                                children: reservationController
                                    .listActivitiesKey.keys
                                    .mapIndexed((index, key) => Container(
                                        margin: const EdgeInsets.only(
                                            bottom: Helper.PADDING / 2),
                                        child: Responsive(
                                            mobile: PackBoxActivityMini(
                                              key_value: key,
                                              activity: reservationController
                                                  .listActivitiesKey[key]!,
                                              initiallyExpanded:
                                                  (reservationController
                                                              .activitySelected
                                                              .value
                                                              .id ==
                                                          reservationController
                                                              .listActivitiesKey[
                                                                  key]!
                                                              .id) ||
                                                      index == 0,
                                            ),
                                            desktop: PackBoxActivity(
                                              key_value: key,
                                              activity: reservationController
                                                  .listActivitiesKey[key]!,
                                              initiallyExpanded:
                                                  (reservationController
                                                              .activitySelected
                                                              .value
                                                              .id ==
                                                          reservationController
                                                              .listActivitiesKey[
                                                                  key]!
                                                              .id) ||
                                                      index == 0,
                                            ))))
                                    .toList(),
                              )),
                            ],
                          ),
                        ),
                        if (!Responsive.isMobile(context) &&
                            !Responsive.isMobileLarge(context))
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
