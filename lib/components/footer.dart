import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final ScrollController _scrollController = ScrollController();
  PagesController pageController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  void animateController(ScrollController controller, double position,
      {int milliseconds = 3}) {
    controller.animateTo(position,
        duration: Duration(milliseconds: milliseconds), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      padding: EdgeInsets.symmetric(
          vertical: Responsive.isMobile(context) ? 40 : 80,
          horizontal: Responsive.isMonitor(context)
              ? Helper.PADDING * 3
              : Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? Helper.PADDING
                  : 0),
      color: AppColor.green,
      child: Column(
        children: [
          Responsive(
            mobile: SvgPicture.asset(
              "assets/images/main/Logo-Lancrage.svg",
              height: 120,
            ),
            desktop: SvgPicture.asset(
              "assets/images/main/Logo-Lancrage.svg",
              height: 150,
            ),
            monitor: SvgPicture.asset(
              "assets/images/main/Logo-Lancrage.svg",
              height: 180,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            children: [
              const Responsive(
                mobile: SizedBox(
                  width: Helper.PADDING,
                ),
                tablet: SizedBox(
                  width: Helper.PADDING * 1.5,
                ),
                desktop: SizedBox(
                  width: Helper.PADDING * 3,
                ),
                monitor: SizedBox(
                  width: Helper.PADDING * 5,
                ),
              ),
              Expanded(
                  child: Responsive(
                mobile: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/");
                        },
                        title: "ACCEUIL",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    const SizedBox(
                      height: Helper.PADDING / 3,
                    ),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/activities");
                        },
                        title: "ACTIVITés",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    const SizedBox(
                      height: Helper.PADDING / 3,
                    ),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/galeries");
                        },
                        title: "GALERIE",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    const SizedBox(
                      height: Helper.PADDING / 3,
                    ),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/a_propos");
                        },
                        title: "à propos",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    const SizedBox(
                      height: Helper.PADDING / 3,
                    ),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/contacts");
                        },
                        title: "Contacts",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                  ],
                ),
                tablet: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/");
                        },
                        title: "ACCEUIL",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/activities");
                        },
                        title: "ACTIVITés",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/galeries");
                        },
                        title: "GALERIE",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/a_propos");
                        },
                        title: "à propos",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/contacts");
                        },
                        title: "Contacts",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                  ],
                ),
                desktop: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/");
                        },
                        title: "ACCEUIL",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/activities");
                        },
                        title: "ACTIVITés",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/galeries");
                        },
                        title: "GALERIE",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/a_propos");
                        },
                        title: "à propos",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                    MenuButtonText(
                        onTap: () {
                          Get.toNamed("/contacts");
                        },
                        title: "Contacts",
                        color: AppColor.white,
                        withPadding: (Responsive.isDesktop(context) ||
                            Responsive.isMonitor(context))),
                  ],
                ),
              )),
              const Responsive(
                mobile: SizedBox(
                  width: Helper.PADDING,
                ),
                tablet: SizedBox(
                  width: Helper.PADDING * 1.5,
                ),
                desktop: SizedBox(
                  width: Helper.PADDING * 3,
                ),
                monitor: SizedBox(
                  width: Helper.PADDING * 5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 120,
          ),
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
          const SizedBox(
            height: Helper.PADDING / 2,
          ),
          if (!Responsive.isMobile(context))
            Container(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  const Divider(
                    color: AppColor.white,
                    height: 2,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: AppColor.white,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/logo/logo-noir.svg",
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      "2023 | L'ANCRAGE",
                      style: AppTextStyle.menuButtonText
                          .copyWith(color: AppColor.white),
                    ),
                  )
                ],
              ),
            ),
          if (Responsive.isMobile(context))
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: Helper.PADDING,
                  ),
                  const Divider(
                    color: AppColor.white,
                    height: 2,
                  ),
                  const SizedBox(
                    height: Helper.PADDING,
                  ),
                  Text(
                    "2023 | L'ANCRAGE",
                    style: AppTextStyle.menuButtonText
                        .copyWith(color: AppColor.white),
                  ),
                  const SizedBox(
                    height: Helper.PADDING,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     animateController(_scrollController, Get.size.height,
                  //         milliseconds: 700);
                  //   },
                  //   child: Container(
                  //     height: 100,
                  //     width: 100,
                  //     child: Center(
                  //       child: Column(
                  //         children: [
                  //           SvgPicture.asset(
                  //             "assets/images/logo/logo-blanc.svg",
                  //             height: 50,
                  //           ),
                  //           Text(
                  //             "Go up",
                  //             style: AppTextStyle.small
                  //                 .copyWith(color: AppColor.white),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
