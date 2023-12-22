import 'package:ancrage/components/main_button.dart';
import 'package:ancrage/components/menu_button_text.dart';
import 'package:ancrage/pages/index.dart';
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
            height: Helper.PADDING * 2,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/images/logo/logo-noir.svg",
                  height: 60,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MenuButtonText(
                      onTap: () {
                        Get.to(const IndexPage());
                      },
                      withPadding: true,
                      title: "ACCEUIL",
                    ),
                    const MenuButtonText(
                      withPadding: true,
                      title: "ACTIVITés",
                    ),
                    const MenuButtonText(
                      withPadding: true,
                      title: "GALERIE",
                    ),
                    const MenuButtonText(
                      withPadding: true,
                      title: "à propos",
                    ),
                    const MenuButtonText(
                      withPadding: true,
                      title: "Contacts",
                    ),
                  ],
                )),
                const SizedBox(
                  width: Helper.PADDING * 2,
                ),
                MainButton(
                  title: "réservation",
                  onTap: () {
                    Get.to(const ReservationPage());
                  },
                ),
                const SizedBox(
                  width: Helper.PADDING * 2,
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
                            height: 30,
                            width: 30,
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
