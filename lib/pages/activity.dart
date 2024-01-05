import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  LoaderController loaderController = Get.find();
  ReservationPageController ActivityPagePageController = Get.find();
  ReservationController reservationController = Get.find();

  final ScrollController _pageController = ScrollController();

  Activity activity = const Activity();

  @override
  void initState() {
    super.initState();

    activity = Get.arguments["activity"];

    _pageController.addListener(() {
      ActivityPagePageController.scrollPosition.value =
          _pageController.position.pixels;
    });
  }

  void animateController(ScrollController controller, double position,
      {int milliseconds = 3}) {
    controller.animateTo(position,
        duration: Duration(milliseconds: milliseconds), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Responsive(
              desktop: Image.network(
                ApiService.MEDIA_URL + activity.background,
                fit: BoxFit.cover,
              ),
              tablet: Image.network(
                ApiService.MEDIA_URL + activity.background,
                fit: BoxFit.fitHeight,
              ),
              mobile: Image.network(
                ApiService.MEDIA_URL + activity.background,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _pageController,
              child: Column(
                children: [
                  Container(
                    width: Get.size.width,
                    height: Get.size.height * 0.55,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.white, width: 0))),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: Get.size.width,
                          height: 30,
                          color: Colors.white,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: Helper.PADDING * 2),
                          padding: const EdgeInsets.all(Helper.PADDING / 1.5),
                          width: Get.size.width * 0.35,
                          height: 250,
                          color: AppColor.background,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Activités".toUpperCase(),
                                style: AppTextStyle.titleLarge.copyWith(
                                    fontSize: 38,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Text(
                                "#${activity.tag}",
                                style: AppTextStyle.titleLarge.copyWith(
                                    fontSize: 38,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Text(
                                "What’s on in L’Ancrage",
                                style: AppTextStyle.titleSmall.copyWith(
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Helper.PADDING * 2),
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: Helper.PADDING * 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity.name,
                                    style: AppTextStyle.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: Helper.PADDING,
                                  ),
                                  Text(
                                    activity.description,
                                    style: AppTextStyle.body,
                                  ),
                                  const SizedBox(
                                    height: Helper.PADDING,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: Helper.PADDING / 2,
                                        horizontal: Helper.PADDING),
                                    height: 250,
                                    color: AppColor.background,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Durée",
                                              style: AppTextStyle.titleSmall,
                                            ),
                                            Text(
                                              "De 2 à 3 heures",
                                              style: AppTextStyle.small,
                                            ),
                                            const Spacer(),
                                            Text(
                                              "A choisir",
                                              style: AppTextStyle.titleSmall,
                                            ),
                                            Text(
                                              "Matin",
                                              style: AppTextStyle.small,
                                            ),
                                            Text(
                                              "Après-midi",
                                              style: AppTextStyle.small,
                                            ),
                                          ],
                                        )),
                                        const SizedBox(
                                          width: Helper.PADDING,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tarif",
                                                  style:
                                                      AppTextStyle.titleSmall,
                                                ),
                                                Text(
                                                  "${activity.publicPrice} Fcfa / en public",
                                                  style: AppTextStyle.small,
                                                ),
                                                Text(
                                                  "${activity.privatePrice} Fcfa / en privé",
                                                  style: AppTextStyle.small,
                                                ),
                                                const Spacer(),
                                                GridView.count(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: (5 / 1),
                                                  controller: ScrollController(
                                                      keepScrollOffset: false),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children:
                                                      "Prévoir des, chaussures de marche, des lunettes de soleil, une crème solaire."
                                                          .split(",")
                                                          .map((item) => Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .circle,
                                                                    size: 5,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                      item
                                                                          .trim(),
                                                                      style: AppTextStyle
                                                                          .small),
                                                                ],
                                                              ))
                                                          .toList(),
                                                ),
                                              ],
                                            )),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: Helper.PADDING,
                            ),
                            Expanded(
                              child: Image.network(
                                ApiService.MEDIA_URL + activity.image,
                                height: Get.size.height * 0.55,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: Helper.PADDING,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: Helper.PADDING / 2,
                        horizontal: Helper.PADDING),
                    height: 400,
                    color: AppColor.background,
                    child: Center(
                      child: SvgPicture.asset("assets/images/bg/Trajet.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 1200,
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        GridView.custom(
                          gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 10,
                            repeatPattern: QuiltedGridRepeatPattern.same,
                            pattern: [
                              const QuiltedGridTile(3, 4),
                              const QuiltedGridTile(3, 2),
                              const QuiltedGridTile(3, 4),
                              const QuiltedGridTile(3, 3),
                              const QuiltedGridTile(3, 4),
                              const QuiltedGridTile(3, 3),
                            ],
                          ),
                          childrenDelegate: SliverChildBuilderDelegate(
                            childCount: 6,
                            (context, index) {
                              switch (index) {
                                case 0:
                                  return ImageActivity(path: activity.image);
                                case 1:
                                  return ImageActivity(path: activity.image1);
                                case 2:
                                  return ImageActivity(path: activity.image2);
                                case 3:
                                  return ImageActivity(path: activity.image3);
                                case 4:
                                  return ImageActivity(path: activity.image4);
                                case 5:
                                  return ImageActivity(path: activity.image5);
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: Helper.PADDING * 2,
                  ),
                  const Footer()
                ],
              ),
            ),
          ),
          const HeaderMenu(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ImageActivity extends StatelessWidget {
  const ImageActivity({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Image.network(
          ApiService.MEDIA_URL + path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
