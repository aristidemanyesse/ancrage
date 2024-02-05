import 'package:ancrage/components/drawer.dart';
import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/slide_image.dart';
import 'package:ancrage/components/transparent_header_menu.dart';
import 'package:ancrage/components/transparent_header_menu_mini.dart';
import 'package:ancrage/components/transparent_header_menu_mini_plus.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/activityController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/pages/come_to_us.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  LoaderController loaderController = Get.find();
  PagesController pageController = Get.find();

  final ScrollController _scrollController = ScrollController();
  final ScrollController _sectionScrollController = ScrollController();
  ActivityController activityController = Get.find();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      pageController.scrollPosition.value = _scrollController.position.pixels;

      if (_sectionScrollController.position.pixels == 0) {
        animateController(_sectionScrollController, 1500, milliseconds: 3000);
      } else {
        animateController(_sectionScrollController, 0, milliseconds: 3000);
      }
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
      drawer: const MyDrawer(),
      body: Stack(
        alignment: Alignment.center,
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
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.background.withOpacity(0.1),
            ),
          ),
          Positioned(
            bottom: Helper.PADDING,
            left: Helper.PADDING * 2,
            child: Responsive(
              mobile: Text(
                "Just live it !",
                style: AppTextStyle.playfair
                    .copyWith(color: AppColor.white, fontSize: 30),
              ),
              tablet: Text(
                "Just live it !",
                style: AppTextStyle.playfair
                    .copyWith(color: AppColor.white, fontSize: 35),
              ),
              desktop: Text(
                "Just live it !",
                style: AppTextStyle.playfair
                    .copyWith(color: AppColor.white, fontSize: 50),
              ),
            ),
          ),
          SizedBox(
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  SizedBox(
                    width: Get.size.width,
                    height: Get.size.height,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child: Responsive(
                            mobile: TransparentHeaderMenuMiniPlus(),
                            mobileLarge: TransparentHeaderMenuMini(
                                pageController: pageController),
                            tablet: TransparentHeaderMenuMini(
                                pageController: pageController),
                            desktop: TransparentHeaderMenu(
                                pageController: pageController),
                          ),
                        ),
                        Responsive(
                          mobile: Container(),
                          desktop: Positioned(
                            bottom: Helper.PADDING,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () {
                                  animateController(
                                      _scrollController, Get.size.height,
                                      milliseconds: 700);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/logo/logo-blanc.svg",
                                  height: Helper.PADDING,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColor.white, AppColor.background])),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Helper.PADDING * 1.5,
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0),
                          child: Column(
                            children: [
                              Text(
                                "In the heart of nature",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.titleLarge.copyWith(
                                  fontSize:
                                      Responsive.isMonitor(context) ? 50 : 40,
                                ),
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Text(
                                "We support you in reconnecting with nature.",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.subtitle
                                    .copyWith(color: AppColor.blue),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0),
                          child: SingleChildScrollView(
                            controller: _sectionScrollController,
                            scrollDirection: Axis.horizontal,
                            child: const Row(
                              children: [
                                SlideImage(
                                  path: "assets/images/bg/Img@2x (1).png",
                                ),
                                SlideImage(
                                    path: "assets/images/bg/Imgml@2x.png"),
                                SlideImage(
                                  path: "assets/images/bg/Img@2x (3).png",
                                ),
                                SlideImage(
                                  path: "assets/images/bg/Img@2x (2).png",
                                ),
                                SlideImage(
                                  path: "assets/images/bg/facade.png",
                                ),
                                SlideImage(
                                  path: "assets/images/bg/Img@2x (4).png",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Responsive(
                          mobile: SizedBox(
                            height: Helper.PADDING,
                          ),
                          desktop: SizedBox(
                            height: Helper.PADDING,
                          ),
                          monitor: SizedBox(
                            height: Helper.PADDING * 2,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MainButton(
                                    title: "view gallery",
                                    onTap: () {
                                      Get.toNamed("/galeries");
                                    },
                                  )
                                ],
                              ),
                              const Responsive(
                                mobile: SizedBox(
                                  height: Helper.PADDING,
                                ),
                                desktop: SizedBox(
                                  height: Helper.PADDING,
                                ),
                                monitor: SizedBox(
                                  height: Helper.PADDING * 2,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Helper.PADDING * 1.5,
                                    horizontal: Responsive.isMonitor(context)
                                        ? Helper.PADDING * 3
                                        : Responsive.isDesktop(context) ||
                                                Responsive.isTablet(context)
                                            ? Helper.PADDING
                                            : 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Naturel & Moderne",
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.titleLarge.copyWith(
                                        fontSize: Responsive.isMonitor(context)
                                            ? 50
                                            : 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: Helper.PADDING,
                                    ),
                                    Responsive(
                                      mobile: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Helper.PADDING),
                                        child: Text(
                                          "Mettant en commun modernisme et nature, nos chambres sont une ouverture vers le monde et la diversité naturelle. \n Le calme et la sérénité de notre hôtel sont étudiés pour vous.",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.subtitle.copyWith(
                                              letterSpacing: 3,
                                              wordSpacing: 2,
                                              height: 1.6,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24),
                                        ),
                                      ),
                                      desktop: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Helper.PADDING * 2),
                                        child: Text(
                                          "Mettant en commun modernisme et nature, nos chambres sont une ouverture vers le monde et la diversité naturelle. \n Le calme et la sérénité de notre hôtel sont étudiés pour vous.",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.subtitle.copyWith(
                                              letterSpacing: 3,
                                              wordSpacing: 2,
                                              height: 1.6,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24),
                                        ),
                                      ),
                                      monitor: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: Helper.PADDING * 5),
                                        child: Text(
                                          "Mettant en commun modernisme et nature, nos chambres sont une ouverture vers le monde et la diversité naturelle. \n Le calme et la sérénité de notre hôtel sont étudiés pour vous.",
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.subtitle.copyWith(
                                              letterSpacing: 3,
                                              wordSpacing: 2,
                                              height: 1.6,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Responsive.isMonitor(context)
                                        ? Helper.PADDING * 3
                                        : Responsive.isDesktop(context) ||
                                                Responsive.isTablet(context)
                                            ? Helper.PADDING
                                            : 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Responsive(
                                      mobile: Image.asset(
                                        "assets/images/bg/piscine2.png",
                                        width: Get.size.width,
                                        fit: BoxFit.cover,
                                      ),
                                      desktop: Image.asset(
                                        "assets/images/bg/piscine.png",
                                        width: Get.size.width * 0.7,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Helper.PADDING * 3,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Services and facilities".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.titleLarge.copyWith(
                                  fontSize:
                                      Responsive.isMonitor(context) ? 50 : 40,
                                ),
                              ),
                              const SizedBox(
                                height: Helper.PADDING,
                              ),
                              GridView.count(
                                  crossAxisCount: Responsive.isMonitor(context)
                                      ? 3
                                      : Responsive.isDesktop(context) ||
                                              Responsive.isTablet(context)
                                          ? 2
                                          : 1,
                                  childAspectRatio:
                                      Responsive.isMonitor(context)
                                          ? (3 / 4)
                                          : (3 / 4.5),
                                  controller:
                                      ScrollController(keepScrollOffset: false),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: ["12", "45", "45"]
                                      .map(
                                        (item) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: Helper.PADDING / 2),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  "assets/images/bg/plage.png",
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical:
                                                            Helper.PADDING / 3),
                                                child: Text(
                                                  "Overview".toUpperCase(),
                                                  style:
                                                      AppTextStyle.titleMedium,
                                                ),
                                              ),
                                              Text(
                                                "L’ANCRAGE is located in one of the most exclusive destinations in the world…",
                                                style: AppTextStyle.subtitle,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: Helper.PADDING / 2,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  MainButton(
                                                    title: "discovery",
                                                    onTap: () {},
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList()),
                            ],
                          ),
                        ),
                        const Responsive(
                          mobile: SizedBox(
                            height: Helper.PADDING,
                          ),
                          desktop: SizedBox(
                            height: Helper.PADDING,
                          ),
                          monitor: SizedBox(
                            height: Helper.PADDING * 2,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Responsive.isMonitor(context)
                                  ? Helper.PADDING * 3
                                  : Responsive.isDesktop(context) ||
                                          Responsive.isTablet(context)
                                      ? Helper.PADDING
                                      : 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "WHAT’S ON IN L’ANCRAGE".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.titleLarge.copyWith(
                                  fontSize:
                                      Responsive.isMonitor(context) ? 50 : 40,
                                ),
                              ),
                              const Responsive(
                                mobile: SizedBox(
                                  height: Helper.PADDING,
                                ),
                                desktop: SizedBox(
                                  height: Helper.PADDING,
                                ),
                                monitor: SizedBox(
                                  height: Helper.PADDING * 2,
                                ),
                              ),
                              GridView.count(
                                  crossAxisCount: Responsive.isMonitor(context)
                                      ? 3
                                      : Responsive.isDesktop(context) ||
                                              Responsive.isTablet(context)
                                          ? 2
                                          : 1,
                                  childAspectRatio:
                                      Responsive.isMonitor(context)
                                          ? (3 / 4)
                                          : Responsive.isDesktop(context) ||
                                                  Responsive.isTablet(context)
                                              ? (5 / 6)
                                              : 0.98,
                                  controller:
                                      ScrollController(keepScrollOffset: false),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: activityController.activities
                                      .map((activity) => Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                Helper.PADDING / 2,
                                                0,
                                                Helper.PADDING / 2,
                                                0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: Image.network(
                                                      ApiService.MEDIA_URL +
                                                          activity.image,
                                                      height:
                                                          Responsive.isMonitor(
                                                                  context)
                                                              ? 500
                                                              : 300,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: Helper.PADDING / 2,
                                                ),
                                                Responsive(
                                                  mobile: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "#${activity.tag}",
                                                        style: AppTextStyle
                                                            .bodygrasitalic,
                                                      ),
                                                      InderlineButton(
                                                        ontap: () {
                                                          Get.toNamed(
                                                              "/activity",
                                                              arguments: {
                                                                "activity":
                                                                    activity
                                                              });
                                                        },
                                                        title: "En savoir plus",
                                                      ),
                                                    ],
                                                  ),
                                                  desktop: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "#${activity.tag}",
                                                        style: AppTextStyle
                                                            .bodygrasitalic,
                                                      ),
                                                      InderlineButton(
                                                        ontap: () {
                                                          Get.toNamed(
                                                              "/activity",
                                                              arguments: {
                                                                "activity":
                                                                    activity
                                                              });
                                                        },
                                                        title: "En savoir plus",
                                                      ),
                                                    ],
                                                  ),
                                                  monitor: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "#${activity.tag}",
                                                              style: AppTextStyle
                                                                  .bodygrasitalic,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InderlineButton(
                                                        ontap: () {
                                                          Get.toNamed(
                                                              "/activity",
                                                              arguments: {
                                                                "activity":
                                                                    activity
                                                              });
                                                        },
                                                        title: "En savoir plus",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      activity.name,
                                                      style: AppTextStyle.body,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList()),
                            ],
                          ),
                        ),
                        if (!Responsive.isMonitor(context))
                          const SizedBox(
                            height: Helper.PADDING,
                          ),
                        const ComeToUs(
                          start: 4900,
                        ),
                      ],
                    ),
                  ),
                  const Footer()
                ],
              ),
            ),
          ),
          const Responsive(
            mobile: HeaderMenuMini(),
            mobileLarge: HeaderMenuMini(),
            tablet: HeaderMenuMini(),
            desktop: HeaderMenu(),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
