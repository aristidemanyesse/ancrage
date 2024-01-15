import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransparentHeaderMenu extends StatelessWidget {
  const TransparentHeaderMenu({
    super.key,
    required this.pageController,
  });

  final PagesController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
      height: Helper.PADDING * 2,
      child: Row(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                Get.toNamed("/");
              },
              child: SvgPicture.asset(
                "assets/images/logo/logo-blanc.svg",
                height: Responsive.isMonitor(context) ? 60 : 45,
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MenuButtonText(
                color: Colors.white,
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
                color: AppColor.white,
                withPadding: true,
                title: "ACTIVITés",
              ),
              MenuButtonText(
                onTap: () {
                  Get.toNamed("/galeries");
                },
                active: Get.currentRoute == "/galeries" ||
                    Get.currentRoute == "/activity",
                color: AppColor.white,
                withPadding: true,
                title: "GALERIE",
              ),
              MenuButtonText(
                color: Colors.white,
                onTap: () {
                  Get.toNamed("/a_propos");
                },
                active: Get.currentRoute == "/a_propos",
                withPadding: true,
                title: "à propos",
              ),
              MenuButtonText(
                color: Colors.white,
                onTap: () {
                  Get.toNamed("/contacts");
                },
                active: Get.currentRoute == "/contacts",
                withPadding: true,
                title: "Contacts",
              ),
            ],
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
          MainButton(
            color: Colors.white,
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
                        height: Responsive.isMonitor(context) ? 30 : 23,
                        width: Responsive.isMonitor(context) ? 30 : 23,
                        child: SvgPicture.asset(
                          pageController.languageSelected.value == "English"
                              ? "assets/images/socials/English-Circle.svg"
                              : "assets/images/socials/English-Circle.svg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      pageController.languageSelected.value.substring(0, 2),
                      style: AppTextStyle.menuButtonText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Colors.white,
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
                        height: Responsive.isMonitor(context) ? 30 : 23,
                        width: Responsive.isMonitor(context) ? 30 : 23,
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
    );
  }
}
