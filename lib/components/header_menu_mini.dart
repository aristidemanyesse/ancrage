import 'package:ancrage/components/drawer.dart';
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
                elevation: pageController.scrollPosition.value > 10 ? 5 : 0,
                margin: const EdgeInsets.all(0),
                child: Container(
                  margin: const EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.size.width * 0.1,
                      vertical: Helper.PADDING / 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      color: AppColor.background.withOpacity(1)),
                  height: Helper.PADDING * 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/");
                          },
                          child: SvgPicture.asset(
                            "assets/images/logo/Logo-Lancrage (1).svg",
                            height: Responsive.isMonitor(context) ? 60 : 45,
                          ),
                        ),
                      ),
                      const Spacer(),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: () {
                            Get.dialog(
                              const MyDrawer(),
                              barrierColor: Colors.transparent,
                            );
                          },
                          child: Text(
                            "MENU",
                            style: AppTextStyle.menuButtonTextSelected,
                          ),
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
