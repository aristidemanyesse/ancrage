import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/components/secondary_button.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 150),
          color: AppColor.green,
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/main/Logo-Lancrage.svg",
                height: 180,
              ),
              const SizedBox(
                height: 80,
              ),
              const Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuButtonText(
                          title: "ACCEUIL",
                          color: AppColor.white,
                        ),
                        MenuButtonText(
                          title: "ACTIVITés",
                          color: AppColor.white,
                        ),
                        MenuButtonText(
                          title: "GALERIE",
                          color: AppColor.white,
                        ),
                        MenuButtonText(
                          title: "BLOG",
                          color: AppColor.white,
                        ),
                        MenuButtonText(
                          title: "à propos",
                          color: AppColor.white,
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryButton(
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
