import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/controllers/reservation_page_controller.dart';
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

  @override
  void initState() {
    super.initState();

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
              desktop: Image.asset(
                "assets/images/bg/Bg.png",
                fit: BoxFit.cover,
              ),
              tablet: Image.asset(
                "assets/images/bg/Bg.png",
                fit: BoxFit.fitHeight,
              ),
              mobile: Image.asset(
                "assets/images/bg/Bg.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
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
                                "réservation".toUpperCase(),
                                style: AppTextStyle.titleLarge.copyWith(
                                    fontSize: 38,
                                    letterSpacing: 5,
                                    fontWeight: FontWeight.w500),
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
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 3,
                                  ),
                                  Text(
                                    "info@ancrage.com",
                                    style: AppTextStyle.bodysmall,
                                  )
                                ],
                              ),
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
                        SizedBox(
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
                                    "occaecati cupiditate non provident, similique sunt ",
                                    style: AppTextStyle.titleSmall,
                                  ),
                                  SizedBox(
                                    height: Helper.PADDING,
                                  ),
                                  Text(
                                    "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore",
                                    style: AppTextStyle.body,
                                  ),
                                  SizedBox(
                                    height: Helper.PADDING,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: Helper.PADDING / 2,
                                        horizontal: Helper.PADDING),
                                    color: AppColor.background,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Votre Sejour",
                                              style: AppTextStyle.titleSmall,
                                            ),
                                            Text(
                                              "Votre Sejour",
                                              style: AppTextStyle.small,
                                            ),
                                            SizedBox(
                                              height: Helper.PADDING,
                                            ),
                                            Text(
                                              "Votre Sejour",
                                              style: AppTextStyle.titleSmall,
                                            ),
                                            Text(
                                              "Votre Sejour",
                                              style: AppTextStyle.small,
                                            ),
                                          ],
                                        )),
                                        SizedBox(
                                          width: Helper.PADDING,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Votre Sejour",
                                                  style:
                                                      AppTextStyle.titleSmall,
                                                ),
                                                Text(
                                                  "Votre Sejour",
                                                  style: AppTextStyle.small,
                                                ),
                                                GridView.count(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: (4 / 1),
                                                  controller: ScrollController(
                                                      keepScrollOffset: false),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  children:
                                                      "Prévoir des chaussures de marche, des lunettes de soleil, une crème solaire."
                                                          .split(" ")
                                                          .map((item) => Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .circle,
                                                                    size: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                      item
                                                                          .trim(),
                                                                      style: AppTextStyle
                                                                          .body),
                                                                ],
                                                              ))
                                                          .toList(),
                                                ),
                                              ],
                                            )),
                                        const Spacer(),
                                        Row(
                                          children: [],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Helper.PADDING,
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/images/bg/Img@2x (1).png",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
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
                  Container(
                    height: 1100,
                    child: GridView.custom(
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 10,
                        repeatPattern: QuiltedGridRepeatPattern.same,
                        pattern: [
                          QuiltedGridTile(3, 4),
                          QuiltedGridTile(3, 2),
                          QuiltedGridTile(3, 4),
                          QuiltedGridTile(3, 3),
                          QuiltedGridTile(3, 4),
                          QuiltedGridTile(3, 3),
                        ],
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: 6,
                        (context, index) => Image.asset(
                          "assets/images/bg/Img@2x (1).png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
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

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? Colors.red,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
