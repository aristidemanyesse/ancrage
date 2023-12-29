import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/form_secondary_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/my_date_field.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/components/pack_box.dart';
import 'package:ancrage/components/my_text_field.dart';
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
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();

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
                                    vertical: Helper.PADDING / 2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: AppColor.background)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Réservation",
                                      style: AppTextStyle.titleMedium,
                                    ),
                                    const Spacer(),
                                    const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: MyDateField(
                                              label: "Départ",
                                              placeholer:
                                                  "Date et heure d'arrivée",
                                            )),
                                            SizedBox(
                                              width: Helper.PADDING / 2,
                                            ),
                                            Expanded(
                                                child: MyDateField(
                                              label: "Arrivée",
                                              placeholer:
                                                  "Date et heure de départ",
                                            )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Helper.PADDING / 2,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: MyTextField(
                                              label: "Personnes",
                                              placeholer:
                                                  "Date et heure d'arrivée",
                                            )),
                                            SizedBox(
                                              width: Helper.PADDING / 2,
                                            ),
                                            Expanded(
                                                child: MyTextField(
                                              label: "Chambres",
                                              placeholer:
                                                  "Date et heure de départ",
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const FormSecondaryButton(
                                            title: "Annuler"),
                                        const SizedBox(
                                          width: Helper.PADDING / 2,
                                        ),
                                        FormMainButton(
                                            onTap: () {
                                              Get.toNamed("/");
                                            },
                                            title: "Valider")
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
                                      vertical: Helper.PADDING / 2,
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
                                        style: AppTextStyle.titleMedium,
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Arrivée",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    ),
                                                    const SizedBox(
                                                      width: Helper.PADDING / 4,
                                                    ),
                                                    Text(
                                                      "Après 15:00",
                                                      style: AppTextStyle
                                                          .subtitle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: Helper.PADDING / 5,
                                                ),
                                                Text(
                                                  "Lun. 25 Dec. 2023",
                                                  style: AppTextStyle.subtitle
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 19),
                                                ),
                                                const SizedBox(
                                                  height: Helper.PADDING / 5,
                                                ),
                                                Text(
                                                  "2 adultes",
                                                  style: AppTextStyle.subtitle
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 19),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Départ",
                                                      style:
                                                          AppTextStyle.subtitle,
                                                    ),
                                                    const SizedBox(
                                                      width: Helper.PADDING / 4,
                                                    ),
                                                    Text(
                                                      "Avant 11:00",
                                                      style: AppTextStyle
                                                          .subtitle
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 19),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: Helper.PADDING / 5,
                                                ),
                                                Text(
                                                  "Dim. 07 Jan. 2024",
                                                  style: AppTextStyle.subtitle
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 19),
                                                ),
                                                const SizedBox(
                                                  height: Helper.PADDING / 5,
                                                ),
                                                Text(
                                                  "1 chambre",
                                                  style: AppTextStyle.subtitle
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 19),
                                                )
                                              ],
                                            ),
                                          ),
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
                                      const SizedBox(
                                        height: Helper.PADDING / 4,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Helper.PADDING / 2),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Total",
                                              style: AppTextStyle.subtitle,
                                            ),
                                            const Spacer(),
                                            Text(
                                              "0 Xof",
                                              style: AppTextStyle.subtitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 19),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Container(
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
                                style: AppTextStyle.titleMedium,
                              ),
                              const SizedBox(
                                height: Helper.PADDING,
                              ),
                              Container(
                                  child: Column(
                                children: pageController.listKey.map((key) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        bottom: Helper.PADDING / 2),
                                    child: PackBox(
                                      key_value: key,
                                      initiallyExpanded: false,
                                    ),
                                  );
                                }).toList(),
                              )),
                            ],
                          ),
                        )),
                        // const ComeToUs(
                        //   start: 1200,
                        // ),
                        SizedBox(
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
          const HeaderMenu(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
