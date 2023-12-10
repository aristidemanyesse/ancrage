import 'package:ancrage/controllers/index_page_controller.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComeToUs extends StatefulWidget {
  final ScrollController pageController;
  const ComeToUs({super.key, required this.pageController});

  @override
  State<ComeToUs> createState() => _ComeToUsState();
}

class _ComeToUsState extends State<ComeToUs> {
  IndexPageController indexPageController = Get.find();

  double _minFontSize = 20;
  double _maxFontSize = 20;

  double lastPosition = 0;
  @override
  void initState() {
    super.initState();

    widget.pageController.addListener(() {
      if (widget.pageController.position.pixels >= 5000) {
        setState(() {
          _minFontSize = indexPageController.scrollAscendant.value ? 100 : 50;
          _maxFontSize = indexPageController.scrollAscendant.value ? 50 : 100;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      color: AppColor.white,
      padding: const EdgeInsets.symmetric(
          vertical: Helper.PADDING * 1.5, horizontal: Helper.PADDING * 3),
      child: Center(
          child: TweenAnimationBuilder(
              key: UniqueKey(),
              tween: Tween<double>(begin: _minFontSize, end: _maxFontSize),
              duration: const Duration(seconds: 3),
              builder: (context, double size, child) {
                return Text(
                  "Come to us, you are at home!",
                  style: AppTextStyle.titleLarge.copyWith(fontSize: size),
                );
              })),
    );
  }
}
