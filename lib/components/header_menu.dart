import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/pages/reservation.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(0),
          child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 80),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: AppColor.background.withOpacity(1)),
            height: 120,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/logo/logo-noir.svg",
                  height: 60,
                ),
                const Spacer(flex: 2),
                const Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuButtonText(
                          title: "ACCEUIL",
                        ),
                        MenuButtonText(
                          title: "ACTIVITés",
                        ),
                        MenuButtonText(
                          title: "GALERIE",
                        ),
                        MenuButtonText(
                          title: "BLOG",
                        ),
                        MenuButtonText(
                          title: "à propos",
                        )
                      ],
                    )),
                const SizedBox(
                  width: 150,
                ),
                MainButton(
                  title: "réservation",
                  onTap: () {
                    Get.to(const ReservationPage());
                  },
                ),
                const SizedBox(
                  width: 70,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: SvgPicture.asset(
                              "assets/images/socials/English-Circle.svg",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "En",
                          style: AppTextStyle.menuButtonText,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
