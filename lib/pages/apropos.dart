import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AproposPage extends StatefulWidget {
  const AproposPage({super.key});

  @override
  State<AproposPage> createState() => _AproposPageState();
}

class _AproposPageState extends State<AproposPage> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      pageController.scrollPosition.value = _scrollController.position.pixels;
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
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColor.white, AppColor.background]),
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: Helper.PADDING * 4),
                              Text(
                                "à propos".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.titleLarge.copyWith(
                                    fontSize: 38,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: Helper.PADDING),
                              SvgPicture.asset(
                                "assets/images/logo/Logo-Lancrage-Horizontal.svg",
                                height: 60,
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Responsive(
                                mobile: Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                                desktop: Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                                monitor: Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SecondaryButton(
                                    onTap: () {
                                      Get.toNamed("/reservation");
                                    },
                                    title: Text(
                                      "reserver".toUpperCase(),
                                      style: AppTextStyle.menuButtonText
                                          .copyWith(color: AppColor.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING * 2),
                        Row(
                          children: [
                            Responsive(
                              mobile: Image.asset(
                                "assets/images/bg/Img@3x.png",
                                width: Get.size.width,
                                fit: BoxFit.cover,
                              ),
                              desktop: Expanded(
                                child: Image.asset(
                                    "assets/images/bg/Img@2x (5).png",
                                    width: double.infinity),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: Helper.PADDING),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Helper.PADDING,
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0),
                          child: Column(
                            children: [
                              Text(
                                "In the heart of nature",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.titleLarge.copyWith(
                                  fontSize:
                                      Responsive.isMonitor(context) ? 50 : 40,
                                ),
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Text(
                                "Nous vous accompagnons dans une reconnexion avec la nature.",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.subtitle
                                    .copyWith(color: AppColor.blue),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Helper.PADDING,
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0),
                          child: SingleChildScrollView(
                            // controller: _sectionController,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainButton(
                              title: "view gallery",
                              onTap: () {},
                            )
                          ],
                        ),
                        const SizedBox(height: Helper.PADDING),
                        Responsive(
                          mobile: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Times@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 4,
                                  ),
                                  Text(
                                    "L'ANCRAGE\n est disponible en permanence pour vous.",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
                              const SizedBox(height: Helper.PADDING / 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 4,
                                  ),
                                  Text(
                                    "+225 07 07 070 707",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
                              const SizedBox(height: Helper.PADDING / 3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 4,
                                  ),
                                  Text(
                                    "info@ancrage.com",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
                            ],
                          ),
                          desktop: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Times@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 4,
                                  ),
                                  Text(
                                    "L'ANCRAGE est disponible en permanence pour vous.",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
                              const SizedBox(width: Helper.PADDING),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 4,
                                  ),
                                  Text(
                                    "+225 07 07 070 707",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
                              const SizedBox(width: Helper.PADDING),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 4,
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
                        const SizedBox(height: Helper.PADDING),
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
