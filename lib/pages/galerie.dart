import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/components/pack_box_activity.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GaleriePage extends StatefulWidget {
  const GaleriePage({super.key});

  @override
  State<GaleriePage> createState() => _GaleriePageState();
}

class _GaleriePageState extends State<GaleriePage> {
  LoaderController loaderController = Get.find();
  ReservationPageController GaleriePagePageController = Get.find();
  ReservationController reservationController = Get.find();

  final ScrollController _pageController = ScrollController();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      GaleriePagePageController.scrollPosition.value =
          _pageController.position.pixels;
    });
  }

  void animateController(ScrollController controller, double position,
      {int milliseconds = 3}) {
    controller.animateTo(position,
        duration: Duration(milliseconds: milliseconds), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Responsive(
              desktop: Image.asset(
                "assets/images/bg/Bg.png",
                fit: BoxFit.cover,
              ),
              tablet: Image.asset(
                "assets/images/bg/Bg.png",
                fit: BoxFit.fitHeight,
              ),
              mobile: Image.asset(
                "assets/images/bg/Bg.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _pageController,
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
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
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
                                            "Package Villa",
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
                                                      "Lun. 25 Dec. 2023 - Lun. 25 Dec. 2023",
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
                                                      "5 050 050 FCFA",
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
                                                Image.asset(
                                                  "assets/images/socials/Times@2x.png",
                                                  height: 20,
                                                ),
                                                const InderlineButton2(
                                                  title:
                                                      "Assistance en chambre disponible dès 08h30",
                                                ),
                                                const SizedBox(
                                                  width: Helper.PADDING / 4,
                                                ),
                                                FormMainButton(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          "/reservation_next");
                                                    },
                                                    title: "Continuer")
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
                                                    "1 - Villa",
                                                    style: AppTextStyle
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                      "2 lits | California King | 75 m²",
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
                                                        "Lun. 25 Dec 2020",
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
                                                        "Lun. 25 Dec 2020",
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
                                                  const InderlineButton2(
                                                    title:
                                                        "Détails de la chambre",
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          Helper.PADDING / 4),
                                                  Text("2 adultes    1 chambre",
                                                      style: AppTextStyle
                                                          .bodysmall
                                                          .copyWith(
                                                              letterSpacing:
                                                                  -1)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: const Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InderlineButton2(
                                                      title: "Modiifer",
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
                              Container(
                                  margin: const EdgeInsets.all(0),
                                  child: Column(
                                    children: reservationController.listKey
                                        .map((key) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: Helper.PADDING / 2),
                                        child: PackBoxActivity(
                                          key_value: key,
                                          initiallyExpanded: false,
                                        ),
                                      );
                                    }).toList(),
                                  )),
                            ],
                          ),
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
