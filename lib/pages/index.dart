import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/pages/come_to_us.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/components/inderline_button.dart';
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
                style: AppTextStyle.contralto.copyWith(color: AppColor.white),
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
                                    "assets/images/bg/facade.png",
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
                                    "assets/images/bg/facade.png",
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
                                    "assets/images/bg/facade.png",
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
                                    onTap: () {},
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
                                children: List.generate(
                                  6,
                                  (index) => Container(
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
                                            cursor: SystemMouseCursors.click,
                                            child: Image.asset(
                                              "assets/images/bg/plage.png",
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
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tourism",
                                                    style: AppTextStyle
                                                        .bodygrasitalic,
                                                  ),
                                                  Text(
                                                    "Visit to tourist sites",
                                                    style: AppTextStyle.body,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const InderlineButton(
                                              title: "Learn more",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
