// ignore_for_file: prefer_const_constructors

import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/models/HotelApp/Album.dart';
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
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();

  Album album = Album();

  @override
  void initState() {
    super.initState();

    album = Get.arguments["album"];

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
                  if (Responsive.isMobileLarge(context) ||
                      Responsive.isMobile(context))
                    Container(
                      height: Get.size.height / 3,
                      width: Get.size.width,
                      color: AppColor.background,
                      padding: EdgeInsets.only(top: Helper.PADDING * 2),
                      child: Center(
                        child: Text(
                          "galérie".toUpperCase(),
                          style: AppTextStyle.titleLarge,
                        ),
                      ),
                    ),
                  if (!Responsive.isMobileLarge(context) &&
                      !Responsive.isMobile(context))
                    Container(
                      width: Get.size.width,
                      height: Get.size.height * 0.55,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 0))),
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
                        if (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
                          SizedBox(
                            height: Helper.PADDING * 2,
                          ),
                        Responsive(
                          mobile: Column(
                            children: [
                              Image.asset(
                                "assets/images/bg/Img@2x (1).png",
                              ),
                              SizedBox(
                                height: Helper.PADDING,
                              ),
                              Text(
                                album.name,
                                style: AppTextStyle.titleSmall,
                              ),
                              SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Helper.PADDING / 3),
                                child: Text(
                                  album.description,
                                  style: AppTextStyle.body,
                                ),
                              ),
                            ],
                          ),
                          desktop: Row(
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
                                      album.name,
                                      style: AppTextStyle.titleSmall,
                                    ),
                                    SizedBox(
                                      height: Helper.PADDING,
                                    ),
                                    Text(
                                      album.description,
                                      style: AppTextStyle.body,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
                        if (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
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
