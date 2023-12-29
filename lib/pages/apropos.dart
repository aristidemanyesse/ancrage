import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/modals/alert.dart';
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
                      color: AppColor.white,
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
                              Row(
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
                              const SizedBox(height: Helper.PADDING),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SecondaryButton(
                                    onTap: () {
                                      Get.toNamed("/reservation");
                                    },
                                    title: "reserver",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING * 2),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                  "assets/images/bg/Img@2x (5).png",
                                  width: double.infinity),
                            ),
                          ],
                        ),
                        const SizedBox(height: Helper.PADDING),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: Helper.PADDING * 1.5,
                              horizontal: Helper.PADDING * 3),
                          child: Column(
                            children: [
                              Text(
                                "In the heart of nature",
                                style: AppTextStyle.titleLarge,
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Text(
                                "Nous vous accompagnons dans une reconnexion avec la nature.",
                                style: AppTextStyle.subtitle
                                    .copyWith(color: AppColor.blue),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Helper.PADDING * 3),
                          child: SingleChildScrollView(
                            // controller: _sectionController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (1).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Imgml@2x.png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (3).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (2).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/facade.png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
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
                        const SizedBox(height: Helper.PADDING),
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
                        Row(
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
                        const SizedBox(height: Helper.PADDING),
                        // const ComeToUs(
                        //   start: 1500,
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
