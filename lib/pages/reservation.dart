import 'dart:async';

import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/form_secondary_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/pages/come_to_us.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  LoaderController loaderController = Get.find();
  ReservationPageController ReservationPagePageController = Get.find();

  final ScrollController _pageController = ScrollController();
  final ScrollController _sectionController = ScrollController();

  int activeMeterIndex = 0; // Expansion Panel
  final StreamController activeMeterIndexStreamControl =
      StreamController.broadcast();
  Stream get onUpdateActiveIndex => activeMeterIndexStreamControl.stream;
  void updateExpansionTile() =>
      activeMeterIndexStreamControl.sink.add(activeMeterIndex);

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      ReservationPagePageController.scrollPosition.value =
          _pageController.position.pixels;
    });
    Future.delayed(const Duration(seconds: 3), () {
      loaderController.wait.value = false;
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
                    height: Get.size.height * 0.6,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.white, width: 0))),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: Get.size.width,
                          height: 100,
                          color: Colors.white,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: Helper.PADDING * 2),
                          padding: const EdgeInsets.all(Helper.PADDING / 1.5),
                          width: Get.size.width * 0.35,
                          height: 350,
                          color: AppColor.background,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/logo/Logo-Lancrage-Horizontal-Reservation@2x.png",
                                height: 130,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Dates@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 3,
                                  ),
                                  Image.asset(
                                    "assets/images/socials/Times@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 3,
                                  ),
                                  const Text(
                                      "L'ANCRAGE est disponible en permanence pour vous.")
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
                                  const Text("+225 07 07 070 707")
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
                                  const Text("info@ancrage.com")
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
                        horizontal: Helper.PADDING * 2),
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
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 400,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Helper.PADDING * 2,
                                    vertical: Helper.PADDING),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: AppColor.background)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Réservation",
                                      style: AppTextStyle.titleLarge,
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FormSecondaryButton(title: "Annuler"),
                                        SizedBox(
                                          width: Helper.PADDING / 2,
                                        ),
                                        FormMainButton(title: "Valider")
                                      ],
                                    )
                                  ],
                                ),
                              )),
                              const SizedBox(
                                width: Helper.PADDING,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Helper.PADDING,
                                      horizontal: Helper.PADDING),
                                  height: 400,
                                  color: AppColor.background,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Votre Sejour",
                                        style: AppTextStyle.titleLarge,
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Arrivée",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    ),
                                                    SizedBox(
                                                      width: Helper.PADDING / 4,
                                                    ),
                                                    Text(
                                                      "Après 15:00",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Lun. 25 Dec. 2023",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "2 adultes",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                          Expanded(
                                              child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Départ",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    ),
                                                    SizedBox(
                                                      width: Helper.PADDING / 4,
                                                    ),
                                                    Text(
                                                      "Avant 11:00",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Dim. 07 Jan. 2024",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "1 chambre",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                      const Spacer(
                                        flex: 2,
                                      ),
                                      const Divider(
                                        height: 5,
                                        thickness: 1,
                                        color: AppColor.green,
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Helper.PADDING / 2),
                                        child: const Row(
                                          children: [
                                            Text("Total"),
                                            Spacer(),
                                            Text("0"),
                                            Text(" Xof"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Container(
                          height: 600,
                          padding: const EdgeInsets.symmetric(
                              horizontal: Helper.PADDING * 2,
                              vertical: Helper.PADDING),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: AppColor.background)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sélection de votre package",
                                style: AppTextStyle.titleLarge,
                              ),
                              const Spacer(),
                              Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 3,
                                    itemBuilder: (BuildContext context, int i) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Helper.PADDING / 2,
                                        ),
                                        child: Container(
                                          child: StreamBuilder(
                                              stream: onUpdateActiveIndex,
                                              builder: (context, snapShot) {
                                                return ExpansionPanelList(
                                                  elevation: 0,
                                                  expansionCallback:
                                                      (int index, bool status) {
                                                    activeMeterIndex =
                                                        snapShot.data == i
                                                            ? -1
                                                            : i;
                                                    updateExpansionTile();
                                                  },
                                                  children: [
                                                    ExpansionPanel(
                                                      canTapOnHeader: true,
                                                      isExpanded:
                                                          snapShot.data == i,
                                                      headerBuilder:
                                                          (BuildContext context,
                                                              bool isExpanded) {
                                                        return MouseRegion(
                                                            cursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: AppColor
                                                                      .background,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              5),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5))),
                                                              padding: EdgeInsets
                                                                  .all(Helper
                                                                          .PADDING /
                                                                      3),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Package Villa",
                                                                    style: AppTextStyle
                                                                        .titleSmall,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        Helper.PADDING /
                                                                            1.5,
                                                                    width: Helper
                                                                            .PADDING /
                                                                        1.5,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                100),
                                                                        border: Border.all(
                                                                            color:
                                                                                AppColor.orange,
                                                                            width: 1)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Icon(
                                                                        snapShot.data !=
                                                                                i
                                                                            ? Icons.add
                                                                            : Icons.close,
                                                                        color: AppColor
                                                                            .orange,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ));
                                                      },
                                                      body: Container(
                                                        decoration: BoxDecoration(
                                                            border: Border(
                                                                left: BorderSide(
                                                                    width: 3,
                                                                    color: AppColor
                                                                        .background),
                                                                right: BorderSide(
                                                                    width: 3,
                                                                    color: AppColor
                                                                        .background),
                                                                bottom: BorderSide(
                                                                    width: 3,
                                                                    color: AppColor
                                                                        .background))),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 2.0,
                                                          horizontal: 2.13,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 2.3,
                                                              ),
                                                              child:
                                                                  const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      );
                                    }),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FormSecondaryButton(title: "Annuler"),
                                  SizedBox(
                                    width: Helper.PADDING / 2,
                                  ),
                                  FormMainButton(title: "Valider")
                                ],
                              )
                            ],
                          ),
                        )),
                        ComeToUs(
                          pageController: _pageController,
                        ),
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
