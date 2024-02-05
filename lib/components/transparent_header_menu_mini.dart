import 'package:ancrage/components/drawer.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TransparentHeaderMenuMini extends StatelessWidget {
  const TransparentHeaderMenuMini({
    super.key,
    required this.pageController,
  });

  final PagesController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                height: 40,
              ),
            ),
          ),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  const MyDrawer(),
                  barrierColor: Colors.transparent,
                );
              },
              child: Text(
                "MENU",
                style: AppTextStyle.menuButtonTextSelected
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
