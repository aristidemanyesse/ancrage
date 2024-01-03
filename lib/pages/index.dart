import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
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

class _IndexPageState extends State<IndexPage> {
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
              child: Text(
                "Just live it !",
                style: AppTextStyle.playfair.copyWith(color: AppColor.white),
              )),
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
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            height: Helper.PADDING * 2,
                            child: Row(
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed("/");
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/logo/logo-blanc.svg",
                                      height: 60,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MenuButtonText(
                                      color: Colors.white,
                                      onTap: () {
                                        Get.toNamed("/");
                                      },
                                      active: Get.currentRoute == "/",
                                      withPadding: true,
                                      title: "menubar_home".tr,
                                    ),
                                    MenuButtonText(
                                      onTap: () {
                                        Get.toNamed("/activities");
                                      },
                                      active:
                                          Get.currentRoute == "/activities" ||
                                              Get.currentRoute == "/activity",
                                      color: AppColor.white,
                                      withPadding: true,
                                      title: "ACTIVITés",
                                    ),
                                    MenuButtonText(
                                      onTap: () {
                                        Get.toNamed("/galeries");
                                      },
                                      active: Get.currentRoute == "/galeries" ||
                                          Get.currentRoute == "/activity",
                                      color: AppColor.white,
                                      withPadding: true,
                                      title: "GALERIE",
                                    ),
                                    MenuButtonText(
                                      color: Colors.white,
                                      onTap: () {
                                        Get.toNamed("/a_propos");
                                      },
                                      active: Get.currentRoute == "/a_propos",
                                      withPadding: true,
                                      title: "à propos",
                                    ),
                                    MenuButtonText(
                                      color: Colors.white,
                                      onTap: () {
                                        Get.toNamed("/contacts");
                                      },
                                      active: Get.currentRoute == "/contacts",
                                      withPadding: true,
                                      title: "Contacts",
                                    ),
                                  ],
                                )),
                                const SizedBox(
                                  width: Helper.PADDING * 2,
                                ),
                                MainButton(
                                  color: Colors.white,
                                  title: "réservation",
                                  onTap: () {
                                    Get.toNamed("/reservation");
                                  },
                                ),
                                const SizedBox(
                                  width: Helper.PADDING * 2,
                                ),
                                DropdownButton(
                                  elevation: 0,
                                  icon: const Icon(
                                    Icons.add_outlined,
                                    size: 0,
                                  ),
                                  underline: Container(),
                                  hint: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Obx(() {
                                      return Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: SvgPicture.asset(
                                                pageController.languageSelected
                                                            .value ==
                                                        "English"
                                                    ? "assets/images/socials/English-Circle.svg"
                                                    : "assets/images/socials/English-Circle.svg",
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            pageController
                                                .languageSelected.value
                                                .substring(0, 2),
                                            style: AppTextStyle.menuButtonText,
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 20,
                                          )
                                        ],
                                      );
                                    }),
                                  ),
                                  items: pageController.languages.keys
                                      .map((String item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: SvgPicture.asset(
                                                "assets/images/socials/English-Circle.svg",
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: Helper.PADDING / 4,
                                          ),
                                          Text(item),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    pageController.languageSelected.value =
                                        newValue!;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: Helper.PADDING * 1.5,
                              horizontal: Helper.PADDING * 3),
                          child: Column(
                            children: [
                              Text(
                                "In the heart of nature",
                                style: AppTextStyle.titleLarge,
                              ),
                              const SizedBox(
                                height: Helper.PADDING / 2,
                              ),
                              Text(
                                "We support you in reconnecting with nature.",
                                style: AppTextStyle.subtitle
                                    .copyWith(color: AppColor.blue),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Helper.PADDING * 3),
                          child: SingleChildScrollView(
                            controller: _sectionScrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (1).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Imgml@2x.png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (3).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (2).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/facade.png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING / 2),
                                  child: Image.asset(
                                    "assets/images/bg/Img@2x (4).png",
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: Helper.PADDING * 2,
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
                              const SizedBox(
                                height: Helper.PADDING * 2,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Helper.PADDING * 1.5,
                                    horizontal: Helper.PADDING * 3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Naturel & Moderne",
                                      style: AppTextStyle.titleLarge,
                                    ),
                                    const SizedBox(
                                      height: Helper.PADDING,
                                    ),
                                    Container(
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
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: Helper.PADDING * 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/bg/piscine.png",
                                      width: Get.size.width * 0.7,
                                    ),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: Helper.PADDING * 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Services and facilities".toUpperCase(),
                                style: AppTextStyle.titleLarge,
                              ),
                              const SizedBox(
                                height: Helper.PADDING,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    3,
                                    (index) => Expanded(
                                          child: Container(
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
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      vertical:
                                                          Helper.PADDING / 3),
                                                  child: Text(
                                                    "Overview".toUpperCase(),
                                                    style: AppTextStyle
                                                        .titleMedium,
                                                  ),
                                                ),
                                                Text(
                                                  "L’ANCRAGE is located in one of the most exclusive destinations in the world…",
                                                  style: AppTextStyle.subtitle,
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
                                        )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: Helper.PADDING * 2,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Helper.PADDING * 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "WHAT’S ON IN L’ANCRAGE".toUpperCase(),
                                style: AppTextStyle.titleLarge,
                              ),
                              const SizedBox(
                                height: Helper.PADDING * 2,
                              ),
                              Wrap(
                                children: activityController.activities
                                    .map(
                                      (activity) => Container(
                                        width: 450,
                                        margin: const EdgeInsets.fromLTRB(
                                            Helper.PADDING / 2,
                                            0,
                                            Helper.PADDING / 2,
                                            Helper.PADDING * 2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: Image.network(
                                                  ApiService.MEDIA_URL +
                                                      activity.image,
                                                  height: 500,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: Helper.PADDING / 2,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                    Get.toNamed("/activity",
                                                        arguments: {
                                                          "activity": activity
                                                        });
                                                  },
                                                  title: "En savoir plus",
                                                ),
                                              ],
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
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
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
          const HeaderMenu(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
