import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_contact.dart';
import 'package:ancrage/components/form_contact_mini.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/header_menu_mini.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  PagesController pageController = Get.find();
  final ScrollController _scrollController = ScrollController();

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
          if (!Responsive.isMobile(context) &&
              !Responsive.isMobileLarge(context))
            SizedBox(
              child: Responsive(
                desktop: Image.asset(
                  "assets/images/bg/Img@2x (6).png",
                  fit: BoxFit.scaleDown,
                ),
                tablet: Image.asset(
                  "assets/images/bg/Img@2x (6).png",
                  fit: BoxFit.cover,
                ),
                mobile: Image.asset(
                  "assets/images/bg/Img@2x (6).png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(
            width: Get.size.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  if (!Responsive.isMobile(context) &&
                      !Responsive.isMobileLarge(context))
                    Container(
                      width: Get.size.width,
                      height: Get.size.height * 0.55,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 0))),
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
                            width: Get.size.width * 0.45,
                            height: 250,
                            color: AppColor.background,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "contacts".toUpperCase(),
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
                      ),
                    ),
                  if (Responsive.isMobile(context) ||
                      Responsive.isMobileLarge(context))
                    Column(
                      children: [
                        const SizedBox(height: Helper.PADDING * 3),
                        Text(
                          "Contacts".toUpperCase(),
                          style: AppTextStyle.titleLarge.copyWith(
                              fontSize: 38,
                              letterSpacing: 5,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
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
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: (Responsive.isMobile(context) ||
                                          !Responsive.isMobileLarge(context))
                                      ? Helper.PADDING
                                      : Helper.PADDING * 2),
                              SvgPicture.asset(
                                "assets/images/logo/Logo-Lancrage-Horizontal.svg",
                                height: 65,
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Responsive(
                                mobile: Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 6,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                                desktop: Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                                monitor: Row(
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                    const Spacer()
                                  ],
                                ),
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SecondaryButton(
                                    onTap: () {
                                      Get.toNamed("/reservation");
                                    },
                                    title: Text(
                                      "reserver".toUpperCase(),
                                      style: AppTextStyle.menuButtonText
                                          .copyWith(color: AppColor.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING * 2),
                        Responsive(
                          mobile: Column(
                            children: [
                              Image.asset(
                                "assets/images/bg/Img@3x.png",
                                width: Get.size.width,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING),
                                  child: const FormContactMini())
                            ],
                          ),
                          desktop: Column(
                            children: [
                              Image.asset(
                                "assets/images/bg/facade.png",
                                fit: BoxFit.fitHeight,
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Helper.PADDING * 2),
                                  child: const FormContact())
                            ],
                          ),
                          monitor: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/bg/facade.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              const SizedBox(width: Helper.PADDING),
                              const Expanded(
                                child: FormContact(),
                              ),
                              const SizedBox(width: Helper.PADDING),
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING),
                        SizedBox(
                          width: double.infinity,
                          height: Get.size.height / 2,
                          child: Stack(
                            children: [
                              FlutterMap(
                                options: const MapOptions(
                                  initialCenter: LatLng(52.518611, 13.408056),
                                  initialZoom: 14,
                                  minZoom: 6,
                                  maxZoom: 20,
                                ),
                                children: [
                                  TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                                      subdomains: const [
                                        'mt0',
                                        'mt1',
                                        'mt2',
                                        'mt3'
                                      ]),
                                  PopupMarkerLayer(
                                    options: PopupMarkerLayerOptions(
                                      markers: [
                                        Marker(
                                          point: const LatLng(
                                              52.518611, 13.408056),
                                          width: 30,
                                          height: 30,
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: SvgPicture.asset(
                                              "assets/images/logo/logo-noir.svg",
                                            ),
                                          ),
                                        ),
                                      ],
                                      popupDisplayOptions: PopupDisplayOptions(
                                          builder: (BuildContext context,
                                              Marker marker) {
                                        return Container(
                                            padding: const EdgeInsets.all(7),
                                            margin: const EdgeInsets.all(10),
                                            height: 80,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                color: AppColor.background,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/logo/logo-noir.svg",
                                                  height: 70,
                                                ),
                                                const SizedBox(
                                                  width: Helper.PADDING / 3,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "L'ANCRAGE",
                                                      style: AppTextStyle
                                                          .subtitle
                                                          .copyWith(
                                                              fontSize: 15),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      "Nous sommes ici",
                                                      style: AppTextStyle.body
                                                          .copyWith(
                                                              fontSize: 13),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      "52.518611, 13.408056",
                                                      style: AppTextStyle.body
                                                          .copyWith(
                                                              color: AppColor
                                                                  .green,
                                                              fontSize: 10),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ));
                                      }),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ],
                          ),
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
