import 'dart:ui';

import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController controller;
  late AnimationController controllerLogo;

  PagesController pagesController = Get.find();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controllerLogo = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controllerLogo.reverse();
        controller.reverse();
        Get.back();
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.9),
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              color: AppColor.background.withOpacity(0.1),
              child: Column(
                children: [
                  const SizedBox(
                    height: Helper.PADDING,
                  ),
                  Image.asset(
                    "assets/images/logo/Logo-Lancrage.png",
                    height: 75,
                  ).animate(controller: controllerLogo).slide(
                        duration: 400.ms,
                        begin: const Offset(-3.0, 0),
                        end: const Offset(0.0, 0.0),
                      ),
                  const SizedBox(
                    height: Helper.PADDING / 2,
                  ),
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
                  const SizedBox(
                    height: Helper.PADDING / 2,
                  ),
                  MainButton(
                    color: Colors.white,
                    title: "réservation",
                    onTap: () {
                      Get.toNamed("/reservation");
                    },
                  ),
                  const SizedBox(
                    height: Helper.PADDING / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Obx(() {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  height:
                                      Responsive.isMonitor(context) ? 30 : 23,
                                  width:
                                      Responsive.isMonitor(context) ? 30 : 23,
                                  child: SvgPicture.asset(
                                    pagesController.languageSelected.value !=
                                            "English"
                                        ? "assets/images/socials/English-Circle.svg"
                                        : "assets/images/socials/English-Circle.svg",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                pagesController.languageSelected.value,
                                style: AppTextStyle.menuButtonText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(
                        width: Helper.PADDING,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Obx(() {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: SizedBox(
                                  height:
                                      Responsive.isMonitor(context) ? 30 : 23,
                                  width:
                                      Responsive.isMonitor(context) ? 30 : 23,
                                  child: SvgPicture.asset(
                                    pagesController.languageSelected.value ==
                                            "English"
                                        ? "assets/images/socials/English-Circle.svg"
                                        : "assets/images/socials/English-Circle.svg",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                pagesController.languageSelected.value,
                                style: AppTextStyle.menuButtonText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Helper.PADDING / 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controllerLogo.reverse();
                          controller.reverse();
                          Get.back();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ).animate(controller: controller).slide(
            duration: 300.ms,
            curve: Curves.easeInOut,
            begin: const Offset(0.0, -1),
            end: const Offset(0.0, 0.0),
          ),
    );
  }
}
