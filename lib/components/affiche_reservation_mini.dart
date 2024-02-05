import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AfficheReservationMini extends StatelessWidget {
  const AfficheReservationMini({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height / 3,
      width: Get.size.width,
      color: AppColor.background,
      padding: const EdgeInsets.symmetric(horizontal: Helper.PADDING / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "réservation".toUpperCase(),
            style: AppTextStyle.titleLarge.copyWith(
                fontSize: 38, letterSpacing: 3, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(
                "assets/images/socials/Times@2x.png",
                height: 30,
              ),
              const SizedBox(
                width: Helper.PADDING / 3,
              ),
              Text(
                "L'ANCRAGE \nest disponible en permanence pour vous.",
                style: AppTextStyle.bodysmall,
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(
                "assets/images/socials/Phone@2x.png",
                height: 30,
              ),
              const SizedBox(
                width: Helper.PADDING / 3,
              ),
              Text(
                "+225 07 07 070 707",
                style: AppTextStyle.bodysmall,
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/socials/Email.svg",
                height: 25,
              ),
              const SizedBox(
                width: Helper.PADDING / 3,
              ),
              Text(
                "contacts@ancrage.com",
                style: AppTextStyle.bodysmall,
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
