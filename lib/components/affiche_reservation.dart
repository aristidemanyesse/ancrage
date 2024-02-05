import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AfficheReservation extends StatelessWidget {
  const AfficheReservation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Helper.PADDING * 2),
      padding: const EdgeInsets.all(Helper.PADDING / 1.5),
      width: Responsive.isTablet(context)
          ? Get.size.width * 0.8
          : Get.size.width * 0.45,
      height: 250,
      color: AppColor.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "réservation".toUpperCase(),
            style: AppTextStyle.titleLarge.copyWith(
                fontSize: 38, letterSpacing: 5, fontWeight: FontWeight.w500),
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
                "L'ANCRAGE est disponible en permanence pour vous.",
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
        ],
      ),
    );
  }
}
