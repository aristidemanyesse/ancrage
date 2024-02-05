import 'package:ancrage/components/activity_item.dart';
import 'package:ancrage/components/activity_item_mini.dart';
import 'package:ancrage/components/activity_item_mini_plus.dart';
import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/controllers/activityController.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();
  ActivityController activityController = Get.find();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      pageController.scrollPosition.value = _scrollController.position.pixels;
    });
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
          SizedBox(
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    width: Get.size.width,
                    height: Get.size.height * 0.55,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.white, width: 0))),
                    child: (!Responsive.isMobileLarge(context) &&
                            !Responsive.isMobile(context))
                        ? Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                width: Get.size.width,
                                height: 30,
                                color: Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: Helper.PADDING * 2),
                                padding:
                                    const EdgeInsets.all(Helper.PADDING / 1.5),
                                width: Get.size.width * 0.45,
                                height: 250,
                                color: AppColor.background,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "activités".toUpperCase(),
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
                              ),
                            ],
                          )
                        : Container(),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColor.white, AppColor.background]),
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
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
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!Responsive.isMobileLarge(context) &&
                                  !Responsive.isMobile(context))
                                const SizedBox(height: Helper.PADDING * 2),
                              Text(
                                "WHAT’S ON IN L’ANCRAGE".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.titleLarge.copyWith(
                                  fontSize:
                                      Responsive.isMonitor(context) ? 50 : 40,
                                ),
                              ),
                              const SizedBox(height: Helper.PADDING * 2),
                              Column(
                                  children: activityController.activities
                                      .map((activity) => Responsive(
                                          mobile: ActivityItemMiniPlus(
                                              activity: activity),
                                          mobileLarge: ActivityItemMini(
                                              activity: activity),
                                          desktop:
                                              ActivityItem(activity: activity)))
                                      .toList())
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING * 2),

                        // const ComeToUs(
                        //   start: 2000,
                        // ),
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
