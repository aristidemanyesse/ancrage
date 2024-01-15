import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/components/my_text_field.dart';
import 'package:ancrage/controllers/optionController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReservationStep3Page extends StatefulWidget {
  const ReservationStep3Page({super.key});

  @override
  State<ReservationStep3Page> createState() => _ReservationStep3PageState();
}

class _ReservationStep3PageState extends State<ReservationStep3Page> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();
  ReservationController reservationController = Get.find();
  OptionController optionController = Get.find();

  DateFormat dateFormat1 = DateFormat('E dd MMM yyyy à kk:mm');
  DateFormat dateFormat2 = DateFormat('E dd MMM yyyy');

  TextEditingController allergieController = TextEditingController();

  final Map<GlobalKey<AdvanceExpansionTileState>, bool> listKey = {};

  @override
  void initState() {
    super.initState();

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
                "assets/images/bg/IMG_7053@2x.png",
                fit: BoxFit.fitHeight,
              ),
              mobile: Image.asset(
                "assets/images/bg/IMG_7053@2x.png",
                fit: BoxFit.fitHeight,
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
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: Get.size.width,
                          height: 30,
                          color: Colors.white,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: Helper.PADDING * 2),
                          padding: const EdgeInsets.all(Helper.PADDING / 1.5),
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
                                    "contacts@ancrage.com",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Helper.PADDING * 3),
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
                                                const SizedBox(
                                                  width: Helper.PADDING / 4,
                                                ),
                                                FormMainButton(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          "/reservation_next_4");
                                                    },
                                                    title: "Passer cette étape")
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
                                  Helper.PADDING / 4,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Image.asset(
                                          "assets/images/bg/facade.png",
                                          fit: BoxFit.fitHeight,
                                        )),
                                    const SizedBox(
                                      width: Helper.PADDING,
                                    ),
                                    Expanded(
                                      flex: 4,
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
                                                    "1 -${reservationController.packSelected.value.name}",
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
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Arrivée",
                                                        style:
                                                            AppTextStyle.small,
                                                      ),
                                                      const SizedBox(
                                                        width:
                                                            Helper.PADDING / 5,
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
                                                        style:
                                                            AppTextStyle.small,
                                                      ),
                                                      const SizedBox(
                                                        width:
                                                            Helper.PADDING / 5,
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
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 2),
                                                  Text(
                                                    "Activité : ${reservationController.activitySelected.value.name}",
                                                    style: AppTextStyle
                                                        .titleMedium,
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
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Helper.PADDING / 2,
                                    horizontal: Helper.PADDING / 4),
                                child: Text(
                                  "Avons-nous pensé à tous ?",
                                  style: AppTextStyle.titleMedium,
                                ),
                              ),
                              AdvanceExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    listKey[listKey.keys.toList()[0]] = !value;
                                  });
                                  if (value) {
                                    for (var key in listKey.keys) {
                                      if (key != listKey.keys.toList()[0]) {
                                        key.currentState?.collapse();
                                      }
                                    }
                                  }
                                },
                                maintainState: true,
                                initiallyExpanded: true,
                                textColor: AppColor.textColor,
                                collapsedTextColor: AppColor.textColor,
                                hideIcon: true,
                                key: listKey.keys.toList()[0],
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Définissez votre confort",
                                      style: AppTextStyle.subtitle,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: AppColor.orange)),
                                      child: Center(
                                          child: Icon(
                                              listKey[listKey.keys.toList()[0]]!
                                                  ? Icons.add
                                                  : Icons.close,
                                              color: AppColor.orange)),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.background, width: 2),
                                ),
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: AppColor.background,
                                                width: 1))),
                                    padding: const EdgeInsets.all(
                                        Helper.PADDING / 3),
                                    child: Column(
                                      children: optionController.groupes
                                          .map((groupe) {
                                        return groupe.name != "HEALTHCARE"
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: Helper.PADDING / 2),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "A• ${groupe.name}",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    ),
                                                    Obx(() {
                                                      return GridView.count(
                                                        crossAxisCount: 5,
                                                        childAspectRatio:
                                                            (8 / 1),
                                                        controller:
                                                            ScrollController(
                                                                keepScrollOffset:
                                                                    false),
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children:
                                                            groupe
                                                                .categorieOption
                                                                .map((item) =>
                                                                    MouseRegion(
                                                                      cursor: SystemMouseCursors
                                                                          .click,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (reservationController
                                                                              .optionsSelected
                                                                              .contains(item)) {
                                                                            reservationController.optionsSelected.remove(item);
                                                                          } else {
                                                                            reservationController.optionsSelected.add(item);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              value: reservationController.optionsSelected.contains(item),
                                                                              onChanged: (bool? value) {
                                                                                if (value!) {
                                                                                  reservationController.optionsSelected.add(item);
                                                                                } else {
                                                                                  reservationController.optionsSelected.remove(item);
                                                                                }
                                                                              },
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(item.name,
                                                                                style: AppTextStyle.bodysmall),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                      );
                                                    }),
                                                  ],
                                                ),
                                              )
                                            : Container();
                                      }).toList(),
                                    ),
                                  )
                                ],
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              AdvanceExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    listKey[listKey.keys.toList()[1]] = !value;
                                  });
                                  if (value) {
                                    for (var key in listKey.keys) {
                                      if (key != listKey.keys.toList()[1]) {
                                        key.currentState?.collapse();
                                      }
                                    }
                                  }
                                },
                                maintainState: true,
                                initiallyExpanded: false,
                                textColor: AppColor.textColor,
                                collapsedTextColor: AppColor.textColor,
                                hideIcon: true,
                                key: listKey.keys.toList()[1],
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Devrions-nous savoir quelque chose sur votre santé:",
                                      style: AppTextStyle.subtitle,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: AppColor.orange)),
                                      child: Center(
                                          child: Icon(
                                              listKey[listKey.keys.toList()[1]]!
                                                  ? Icons.add
                                                  : Icons.close,
                                              color: AppColor.orange)),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.background, width: 2),
                                ),
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: AppColor.background,
                                                width: 1))),
                                    padding: const EdgeInsets.all(
                                        Helper.PADDING / 3),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Obx(() {
                                              return Checkbox(
                                                value: reservationController
                                                    .isAllergies.value,
                                                onChanged: (bool? value) {
                                                  reservationController
                                                      .isAllergies
                                                      .value = value ?? false;
                                                },
                                              );
                                            }),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    reservationController
                                                            .isAllergies.value =
                                                        !reservationController
                                                            .isAllergies.value;
                                                  },
                                                  child: Text(
                                                      "Allergies alimentaires",
                                                      style: AppTextStyle
                                                          .bodysmall),
                                                )),
                                            const SizedBox(
                                              width: Helper.PADDING,
                                            ),
                                            Obx(() {
                                              return Visibility(
                                                visible: reservationController
                                                    .isAllergies.value,
                                                child: Expanded(
                                                  child: MyTextField(
                                                    onChanged: (String value) {
                                                      reservationController
                                                          .allergies
                                                          .value = value;
                                                    },
                                                    controller:
                                                        allergieController,
                                                    label: "",
                                                    placeholer:
                                                        "Spécifiez vos allergies en les séparant par une virgule",
                                                  ),
                                                ),
                                              );
                                            }),
                                            const Spacer(),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: Helper.PADDING / 2,
                                        ),
                                        Column(
                                          children: optionController.groupes
                                              .map((groupe) {
                                            return groupe.name == "HEALTHCARE"
                                                ? Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom:
                                                                Helper.PADDING /
                                                                    2),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Text(
                                                        //   "A• ${groupe.name}",
                                                        //   style: AppTextStyle
                                                        //       .subtitle,
                                                        // ),
                                                        Obx(() {
                                                          return GridView.count(
                                                            crossAxisCount: 5,
                                                            childAspectRatio:
                                                                (8 / 1),
                                                            controller:
                                                                ScrollController(
                                                                    keepScrollOffset:
                                                                        false),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            children: groupe
                                                                .categorieOption
                                                                .map((item) =>
                                                                    MouseRegion(
                                                                      cursor: SystemMouseCursors
                                                                          .click,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (reservationController
                                                                              .careSelected
                                                                              .contains(item)) {
                                                                            reservationController.careSelected.remove(item);
                                                                          } else {
                                                                            reservationController.careSelected.add(item);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              value: reservationController.careSelected.contains(item),
                                                                              onChanged: (bool? value) {
                                                                                if (value!) {
                                                                                  reservationController.careSelected.add(item);
                                                                                } else {
                                                                                  reservationController.careSelected.remove(item);
                                                                                }
                                                                              },
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(item.name,
                                                                                style: AppTextStyle.bodysmall),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                          );
                                                        }),
                                                      ],
                                                    ),
                                                  )
                                                : Container();
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              AdvanceExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    listKey[listKey.keys.toList()[2]] = !value;
                                  });
                                  if (value) {
                                    for (var key in listKey.keys) {
                                      if (key != listKey.keys.toList()[2]) {
                                        key.currentState?.collapse();
                                      }
                                    }
                                  }
                                },
                                maintainState: true,
                                initiallyExpanded: false,
                                textColor: AppColor.textColor,
                                collapsedTextColor: AppColor.textColor,
                                hideIcon: true,
                                key: listKey.keys.toList()[2],
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Résumé des charges",
                                      style: AppTextStyle.subtitle,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          border: Border.all(
                                              color: AppColor.orange)),
                                      child: Center(
                                          child: Icon(
                                              listKey[listKey.keys.toList()[2]]!
                                                  ? Icons.add
                                                  : Icons.close,
                                              color: AppColor.orange)),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.background, width: 2),
                                ),
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: AppColor.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: AppColor.background,
                                                width: 1))),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Helper.PADDING / 4,
                                        vertical: Helper.PADDING / 2),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Montant de la chambre par séjour",
                                                    style: AppTextStyle.small,
                                                  ),
                                                  const SizedBox(
                                                    height: Helper.PADDING / 5,
                                                  ),
                                                  Text(
                                                    "${reservationController.packSelected.value.price} FCFA",
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
                                                    "Montant de la chambre pour votre séjour",
                                                    style: AppTextStyle.small,
                                                  ),
                                                  const SizedBox(
                                                    height: Helper.PADDING / 5,
                                                  ),
                                                  Text(
                                                    "${reservationController.packSelected.value.price * reservationController.jours.value} FCFA pour un séjour de ${reservationController.jours}Jrs",
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
                                                    "Charges extra",
                                                    style: AppTextStyle.small,
                                                  ),
                                                  const SizedBox(
                                                    height: Helper.PADDING / 5,
                                                  ),
                                                  Text(
                                                    "${reservationController.montant.value - (reservationController.packSelected.value.price * reservationController.jours.value)} FCFA",
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
                                                    "Taxes & TVA",
                                                    style: AppTextStyle.small,
                                                  ),
                                                  const SizedBox(
                                                    height: Helper.PADDING / 5,
                                                  ),
                                                  Text(
                                                    "${reservationController.montant.value * 0.18} Fcfa",
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
                                            const Spacer(),
                                            Text("Imprimer reçu",
                                                style: AppTextStyle.body
                                                    .copyWith(
                                                        letterSpacing: -1,
                                                        color: AppColor.orange,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Helper.PADDING / 2,
                                  ),
                                ],
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: Helper.PADDING / 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FormMainButton(
                                        onTap: () {
                                          Get.toNamed("/reservation_next_4");
                                        },
                                        title: "Commander")
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
          const HeaderMenu(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
