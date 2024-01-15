import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeaderMenu extends StatefulWidget {
  const HeaderMenu({super.key});

  @override
  State<HeaderMenu> createState() => _HeaderMenuState();
}

class _HeaderMenuState extends State<HeaderMenu> {
  PagesController pageController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return pageController.scrollPosition.value > 150 ||
              Get.currentRoute != "/"
          ? Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.all(0),
                child: Container(
                  margin: const EdgeInsets.all(0),
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.size.width * 0.1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      color: AppColor.background.withOpacity(1)),
                  height: Responsive.isMonitor(context)
                      ? Helper.PADDING * 2
                      : Helper.PADDING * 1.5,
                  child: Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/");
                          },
                          child: SvgPicture.asset(
                            "assets/images/logo/logo-noir.svg",
                            height: Responsive.isMonitor(context) ? 60 : 45,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MenuButtonText(
                            onTap: () {
                              Get.toNamed("/");
                            },
                            active: Get.currentRoute == "/",
                            withPadding: true,
                            title: "menubar_home".tr,
                          ),
                          MenuButtonText(
                            onTap: () {
                              Get.toNamed("/activities");
                            },
                            active: Get.currentRoute == "/activities" ||
                                Get.currentRoute == "/activity",
                            withPadding: true,
                            title: "ACTIVITés",
                          ),
                          MenuButtonText(
                            onTap: () {
                              Get.toNamed("/galeries");
                            },
                            active: Get.currentRoute == "/galeries" ||
                                Get.currentRoute == "/galerie",
                            withPadding: true,
                            title: "GALERIE",
                          ),
                          MenuButtonText(
                            onTap: () {
                              Get.toNamed("/a_propos");
                            },
                            active: Get.currentRoute == "/a_propos",
                            withPadding: true,
                            title: "à propos",
                          ),
                          MenuButtonText(
                            onTap: () {
                              Get.toNamed("/contacts");
                            },
                            active: Get.currentRoute == "/contacts",
                            withPadding: true,
                            title: "Contacts",
                          ),
                        ],
                      )),
                      Responsive(
                        mobile: Container(),
                        tablet: Container(),
                        desktop: SizedBox(
                          width: Get.size.width * 0.02,
                        ),
                        monitor: SizedBox(
                          width: Get.size.width * 0.05,
                        ),
                      ),
                      MainButton(
                        title: "réservation",
                        onTap: () {
                          Get.toNamed("/reservation");
                        },
                      ),
                      Responsive(
                        mobile: Container(),
                        tablet: Container(),
                        desktop: SizedBox(
                          width: Get.size.width * 0.02,
                        ),
                        monitor: SizedBox(
                          width: Get.size.width * 0.05,
                        ),
                      ),
                      DropdownButton(
                        elevation: 0,
                        icon: const Icon(
                          Icons.add_outlined,
                          size: 0,
                        ),
                        underline: Container(),
                        hint: MouseRegion(
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
                                      pageController.languageSelected.value ==
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
                                  pageController.languageSelected.value
                                      .substring(0, 2),
                                  style: AppTextStyle.menuButtonText,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                )
                              ],
                            );
                          }),
                        ),
                        items: pageController.languages.keys.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox(
                                    height:
                                        Responsive.isMonitor(context) ? 30 : 23,
                                    width:
                                        Responsive.isMonitor(context) ? 30 : 23,
                                    child: SvgPicture.asset(
                                      "assets/images/socials/English-Circle.svg",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: Helper.PADDING / 4,
                                ),
                                Text(item),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          pageController.languageSelected.value = newValue!;
                        },
                      ),
                    ],
                  ),
                ),
              ))
          : Container();
    });
  }
}
