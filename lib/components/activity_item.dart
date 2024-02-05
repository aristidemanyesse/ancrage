import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;
  const ActivityItem({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Helper.PADDING * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${activity.tag}",
                  style: AppTextStyle.bodygrasitalic,
                ),
                const SizedBox(height: Helper.PADDING / 2),
                Text(
                  activity.name,
                  style: AppTextStyle.body,
                ),
                const SizedBox(height: Helper.PADDING / 2),
                InderlineButton(
                  ontap: () {
                    Get.toNamed("/activity", arguments: {"activity": activity});
                  },
                  title: "En savoir plus",
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(right: Helper.PADDING / 2),
                        child: Image.network(
                          ApiService.MEDIA_URL + activity.image,
                          width: Get.size.width / 4,
                          height: 500,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(right: Helper.PADDING / 2),
                        child: Image.network(
                          ApiService.MEDIA_URL + activity.image1,
                          width: Get.size.width / 4,
                          height: 500,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(right: Helper.PADDING / 2),
                        child: Image.network(
                          ApiService.MEDIA_URL + activity.image2,
                          width: Get.size.width / 4,
                          height: 500,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(right: Helper.PADDING / 2),
                        child: Image.network(
                          ApiService.MEDIA_URL + activity.image3,
                          width: Get.size.width / 5,
                          height: 500,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
