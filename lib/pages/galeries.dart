import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/controllers/galerieController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/core/apiservice.dart';
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
  GalerieController galerieController = Get.find();

  @override
  void initState() {
    super.initState();
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
              child: Responsive(
                  mobile: Text(
                    "Notre galerie photo",
                    style: AppTextStyle.playfair
                        .copyWith(color: AppColor.white, fontSize: 25),
                  ),
                  tablet: Text(
                    "Notre galerie photo",
                    style: AppTextStyle.playfair
                        .copyWith(color: AppColor.white, fontSize: 30),
                  ),
                  desktop: Text(
                    "Notre galerie photo",
                    style: AppTextStyle.playfair
                        .copyWith(color: AppColor.white, fontSize: 35),
                  ))),
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
                        if (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
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
                    width: Get.size.width,
                    padding: EdgeInsets.symmetric(
                        vertical: Helper.PADDING * 1.5,
                        horizontal: Responsive.isMonitor(context)
                            ? Helper.PADDING * 3
                            : Responsive.isDesktop(context) ||
                                    Responsive.isTablet(context)
                                ? Helper.PADDING
                                : 0),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColor.white, AppColor.background])),
                    child: Responsive(
                      mobile: Column(
                        children: galerieController.albums.map((album) {
                          return album.imageAlbum.isNotEmpty
                              ? MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/galerie",
                                          arguments: {"album": album});
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            ApiService.MEDIA_URL +
                                                album.imageAlbum.first.image,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(
                                            height: Helper.PADDING / 2,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            Helper.PADDING / 3),
                                                child: Text(
                                                  album.name,
                                                  style:
                                                      AppTextStyle.titleMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container();
                        }).toList(),
                      ),
                      mobileLarge: Column(
                        children: galerieController.albums.map((album) {
                          return album.imageAlbum.isNotEmpty
                              ? MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/galerie",
                                          arguments: {"album": album});
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            ApiService.MEDIA_URL +
                                                album.imageAlbum.first.image,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(
                                            height: Helper.PADDING / 2,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                album.name,
                                                style: AppTextStyle.titleMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container();
                        }).toList(),
                      ),
                      desktop: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        mainAxisSpacing: Helper.PADDING,
                        crossAxisSpacing: Helper.PADDING,
                        children: galerieController.albums.map((album) {
                          return album.imageAlbum.isNotEmpty
                              ? MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/galerie",
                                          arguments: {"album": album});
                                    },
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            ApiService.MEDIA_URL +
                                                album.imageAlbum.first.image,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: Helper.PADDING / 2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              album.name,
                                              style: AppTextStyle.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container();
                        }).toList(),
                      ),
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
