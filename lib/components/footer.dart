import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.size.width,
          padding: EdgeInsets.symmetric(
              vertical: 80,
              horizontal: Responsive.isMonitor(context)
                  ? Helper.PADDING * 3
                  : Helper.PADDING),
          color: AppColor.green,
          child: Column(
            children: [
              Responsive(
                mobile: SvgPicture.asset(
                  "assets/images/main/Logo-Lancrage.svg",
                  height: 120,
                ),
                desktop: SvgPicture.asset(
                  "assets/images/main/Logo-Lancrage.svg",
                  height: 150,
                ),
                monitor: SvgPicture.asset(
                  "assets/images/main/Logo-Lancrage.svg",
                  height: 180,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Responsive(
                    mobile: SizedBox(
                      width: Helper.PADDING,
                    ),
                    tablet: SizedBox(
                      width: Helper.PADDING * 1.5,
                    ),
                    desktop: SizedBox(
                      width: Helper.PADDING * 3,
                    ),
                    monitor: SizedBox(
                      width: Helper.PADDING * 5,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuButtonText(
                            onTap: () {
                              Get.toNamed("/");
                            },
                            title: "ACCEUIL",
                            color: AppColor.white,
                            withPadding: (Responsive.isDesktop(context) ||
                                Responsive.isMonitor(context))),
                        MenuButtonText(
                            onTap: () {
                              Get.toNamed("/activities");
                            },
                            title: "ACTIVITés",
                            color: AppColor.white,
                            withPadding: (Responsive.isDesktop(context) ||
                                Responsive.isMonitor(context))),
                        MenuButtonText(
                            onTap: () {
                              Get.toNamed("/galeries");
                            },
                            title: "GALERIE",
                            color: AppColor.white,
                            withPadding: (Responsive.isDesktop(context) ||
                                Responsive.isMonitor(context))),
                        MenuButtonText(
                            onTap: () {
                              Get.toNamed("/a_propos");
                            },
                            title: "à propos",
                            color: AppColor.white,
                            withPadding: (Responsive.isDesktop(context) ||
                                Responsive.isMonitor(context))),
                        MenuButtonText(
                            onTap: () {
                              Get.toNamed("/contacts");
                            },
                            title: "Contacts",
                            color: AppColor.white,
                            withPadding: (Responsive.isDesktop(context) ||
                                Responsive.isMonitor(context))),
                      ],
                    ),
                  ),
                  Responsive(
                    mobile: SizedBox(
                      width: Helper.PADDING,
                    ),
                    tablet: SizedBox(
                      width: Helper.PADDING * 1.5,
                    ),
                    desktop: SizedBox(
                      width: Helper.PADDING * 3,
                    ),
                    monitor: SizedBox(
                      width: Helper.PADDING * 5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryButton(
                    onTap: () {
                      Get.toNamed("/reservation");
                    },
                    title: "reserver",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    const Divider(
                      color: AppColor.white,
                      height: 2,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 100,
                        width: 100,
                        color: AppColor.white,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/logo/logo-noir.svg",
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        "2023 | L'ANCRAGE",
                        style: AppTextStyle.menuButtonText
                            .copyWith(color: AppColor.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
