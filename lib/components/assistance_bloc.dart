import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AssistanceBloc extends StatelessWidget {
  const AssistanceBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/socials/Heure.svg",
                height: 18,
              ),
              InderlineButton2(
                onTap: () {},
                title: "Assistance en chambre disponible dès 08h30",
              ),
            ],
          ),
          const SizedBox(
            height: Helper.PADDING / 4,
          ),
          FormMainButton(
              onTap: () {
                Get.toNamed("/reservation_next_3");
              },
              title: Text("Passer",
                  style: AppTextStyle.menuButtonText
                      .copyWith(color: AppColor.white)))
        ],
      ),
      desktop: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/socials/Heure.svg",
                height: 18,
              ),
              InderlineButton2(
                onTap: () {},
                title: "Assistance en chambre disponible dès 08h30",
              ),
            ],
          ),
          const SizedBox(
            height: Helper.PADDING / 4,
          ),
          FormMainButton(
              onTap: () {
                Get.toNamed("/reservation_next_3");
              },
              title: Text("Passer cette étape",
                  style: AppTextStyle.menuButtonText
                      .copyWith(color: AppColor.white)))
        ],
      ),
      monitor: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/socials/Heure.svg",
            height: 18,
          ),
          InderlineButton2(
            onTap: () {},
            title: "Assistance en chambre disponible dès 08h30",
          ),
          const SizedBox(
            width: Helper.PADDING / 4,
          ),
          FormMainButton(
              onTap: () {
                Get.toNamed("/reservation_next_3");
              },
              title: Text("Passer cette étape",
                  style: AppTextStyle.menuButtonText
                      .copyWith(color: AppColor.white)))
        ],
      ),
    );
  }
}
