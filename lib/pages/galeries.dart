import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/pages/come_to_us.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GaleriesPage extends StatefulWidget {
  const GaleriesPage({super.key});

  @override
  State<GaleriesPage> createState() => _GaleriesPageState();
}

class _GaleriesPageState extends State<GaleriesPage> {
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
                "Notre galerie photo",
                style: AppTextStyle.playfair.copyWith(color: AppColor.green),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: Helper.PADDING * 2,
                        vertical: Helper.PADDING * 2),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColor.white, AppColor.background])),
                    child: Column(
                      children: [
                        Container(
                          child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: .85,
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              mainAxisSpacing: Helper.PADDING,
                              crossAxisSpacing: Helper.PADDING,
                              children: List.generate(6, (index) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/galerie");
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Image.asset(
                                              "assets/images/bg/Bg.png",
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Helper.PADDING / 2,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "ghhgkj",
                                                style: AppTextStyle.titleMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })),
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
