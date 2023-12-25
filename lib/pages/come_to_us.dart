import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComeToUs extends StatefulWidget {
  final int start;
  const ComeToUs({super.key, required this.start});

  @override
  State<ComeToUs> createState() => _ComeToUsState();
}

class _ComeToUsState extends State<ComeToUs> {
  PagesController pageController = Get.find();

  double fontSize = 50;
  double new_fontSize = 50;

  @override
  void initState() {
    super.initState();

    ever(pageController.scrollPosition, (value) {
      if (pageController.scrollPosition.value > widget.start) {
        setState(() {
          fontSize = new_fontSize;
          new_fontSize = 50 *
              (1 + (pageController.scrollPosition.value - widget.start) / 700);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.size.width,
          padding: const EdgeInsets.symmetric(
              vertical: Helper.PADDING * 2.5, horizontal: Helper.PADDING * 3),
        ),
        Center(
          child: TweenAnimationBuilder(
              key: UniqueKey(),
              tween: Tween<double>(begin: fontSize, end: new_fontSize),
              duration: const Duration(milliseconds: 500),
              builder: (context, double size, child) {
                return Text(
                  "Come to us, you are at home!",
                  style: AppTextStyle.contralto.copyWith(
                    fontSize: size,
                    fontStyle: FontStyle.italic,
                  ),
                );
              }),
        )
      ],
    );
  }
}
