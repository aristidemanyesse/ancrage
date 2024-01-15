import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeaderMenuMini extends StatefulWidget {
  const HeaderMenuMini({super.key});

  @override
  State<HeaderMenuMini> createState() => _HeaderMenuMiniState();
}

class _HeaderMenuMiniState extends State<HeaderMenuMini> {
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
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: AppColor.textColor, width: 2)),
                        child: Icon(
                          Icons.menu,
                          color: AppColor.textColor,
                        ),
                      )
                    ],
                  ),
                ),
              ))
          : Container();
    });
  }
}
