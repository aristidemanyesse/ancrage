import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityItemMiniPlus extends StatelessWidget {
  final Activity activity;
  const ActivityItemMiniPlus({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Helper.PADDING * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: Helper.PADDING / 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${activity.tag}",
                  style: AppTextStyle.bodygrasitalic,
                ),
                const SizedBox(height: Helper.PADDING / 4),
                Text(
                  activity.name,
                  style: AppTextStyle.body,
                ),
                const SizedBox(height: Helper.PADDING / 4),
                InderlineButton(
                  ontap: () {
                    Get.toNamed("/activity", arguments: {"activity": activity});
                  },
                  title: "En savoir plus",
                ),
              ],
            ),
          ),
          const SizedBox(height: Helper.PADDING / 2),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: Helper.PADDING / 2),
                    child: Image.network(
                      ApiService.MEDIA_URL + activity.image,
                      width: Get.size.width,
                      height: 500,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: Helper.PADDING / 2),
                    child: Image.network(
                      ApiService.MEDIA_URL + activity.image1,
                      width: Get.size.width,
                      height: 500,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: Helper.PADDING / 2),
                    child: Image.network(
                      ApiService.MEDIA_URL + activity.image2,
                      width: Get.size.width,
                      height: 500,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: Helper.PADDING / 2),
                    child: Image.network(
                      ApiService.MEDIA_URL + activity.image3,
                      width: Get.size.width,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
