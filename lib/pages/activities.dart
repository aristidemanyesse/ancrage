import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/controllers/activityController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();
  ActivityController activityController = Get.find();

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
                                "activités".toUpperCase(),
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
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: Helper.PADDING * 2),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: Helper.PADDING * 2),
                              Text(
                                "WHAT’S ON IN L’ANCRAGE".toUpperCase(),
                                style: AppTextStyle.titleLarge,
                              ),
                              const SizedBox(height: Helper.PADDING * 2),
                              Column(
                                  children: activityController.activities
                                      .map((activity) => Container(
                                            padding: const EdgeInsets.only(
                                                bottom: Helper.PADDING * 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "#${activity.tag}",
                                                        style: AppTextStyle
                                                            .bodygrasitalic,
                                                      ),
                                                      Text(
                                                        activity.name,
                                                        style:
                                                            AppTextStyle.body,
                                                      ),
                                                      InderlineButton(
                                                        ontap: () {
                                                          Get.toNamed(
                                                              "/activity",
                                                              arguments: {
                                                                "activity":
                                                                    activity
                                                              });
                                                        },
                                                        title:
                                                            "En savoir plus...",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: Helper
                                                                      .PADDING /
                                                                  2),
                                                          child: Image.network(
                                                            ApiService
                                                                    .MEDIA_URL +
                                                                activity.image,
                                                            width:
                                                                Get.size.width /
                                                                    5,
                                                            height: 500,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: Helper
                                                                      .PADDING /
                                                                  2),
                                                          child: Image.network(
                                                            ApiService
                                                                    .MEDIA_URL +
                                                                activity.image1,
                                                            width:
                                                                Get.size.width /
                                                                    5,
                                                            height: 500,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: Helper
                                                                      .PADDING /
                                                                  2),
                                                          child: Image.network(
                                                            ApiService
                                                                    .MEDIA_URL +
                                                                activity.image2,
                                                            width:
                                                                Get.size.width /
                                                                    5,
                                                            height: 500,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: Helper
                                                                      .PADDING /
                                                                  2),
                                                          child: Image.network(
                                                            ApiService
                                                                    .MEDIA_URL +
                                                                activity.image3,
                                                            width:
                                                                Get.size.width /
                                                                    5,
                                                            height: 500,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ))
                                      .toList())
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING * 2),

                        // const ComeToUs(
                        //   start: 2000,
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
