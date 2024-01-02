// ignore_for_file: prefer_const_constructors

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
                        horizontal: Helper.PADDING * 2),
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Helper.PADDING * 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/images/bg/Img@2x (1).png",
                              ),
                            ),
                            SizedBox(
                              width: Helper.PADDING,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "occaecati cupiditate non provident, similique sunt ",
                                    style: AppTextStyle.titleSmall,
                                  ),
                                  SizedBox(
                                    height: Helper.PADDING,
                                  ),
                                  Text(
                                    "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
                                    style: AppTextStyle.body,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Helper.PADDING / 2,
                        ),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (1).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Imgml@2x.png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (3).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (2).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/facade.png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (4).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
