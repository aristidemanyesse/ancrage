import 'package:ancrage/components/drawer.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransparentHeaderMenuMiniPlus extends StatelessWidget {
  TransparentHeaderMenuMiniPlus({
    super.key,
  });

  PagesController pagesController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      height: Helper.PADDING * 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  const MyDrawer(),
                  barrierColor: Colors.transparent,
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo/Logo-Lancrage.png",
                    height: 50,
                  ),
                  Text(
                    "MENU",
                    style: AppTextStyle.menuButtonTextSelected
                        .copyWith(color: Colors.white),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
