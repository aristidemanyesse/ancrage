import 'package:ancrage/components/footer.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/form_secondary_button.dart';
import 'package:ancrage/components/header_menu.dart';
import 'package:ancrage/components/my_text_field.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/page_controller.dart';
import 'package:ancrage/modals/alert.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
          SizedBox(
            child: Responsive(
              desktop: Image.asset(
                "assets/images/bg/Img@2x (6).png",
                fit: BoxFit.scaleDown,
              ),
              tablet: Image.asset(
                "assets/images/bg/Img@2x (6).png",
                fit: BoxFit.fitHeight,
              ),
              mobile: Image.asset(
                "assets/images/bg/Img@2x (6).png",
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
                          width: Get.size.width * 0.35,
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
                                  Image.asset(
                                    "assets/images/socials/Phone@2x.png",
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: Helper.PADDING / 3,
                                  ),
                                  Text(
                                    "info@ancrage.com",
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
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                          top: BorderSide(color: Colors.white, width: 0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: Helper.PADDING * 2),
                              SvgPicture.asset(
                                "assets/images/logo/Logo-Lancrage-Horizontal.svg",
                                height: 65,
                              ),
                              const SizedBox(height: Helper.PADDING),
                              Row(
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
                              const SizedBox(height: Helper.PADDING),
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
                            ],
                          ),
                        ),
                        const SizedBox(height: Helper.PADDING * 2),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                "assets/images/bg/facade.png",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const SizedBox(width: Helper.PADDING),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: Helper.PADDING * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "GET IN TOUCH".toUpperCase(),
                                      style: AppTextStyle.titleLarge.copyWith(
                                          fontSize: 38,
                                          letterSpacing: 5,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: Helper.PADDING),
                                    const Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              MyTextField(
                                                label: "Nom complet",
                                                placeholer:
                                                    "Date et heure de départ",
                                              ),
                                              SizedBox(
                                                  height: Helper.PADDING / 3),
                                              MyTextField(
                                                label: "Sujet",
                                                placeholer:
                                                    "Date et heure de départ",
                                              ),
                                              SizedBox(
                                                  height: Helper.PADDING / 3),
                                              MyTextField(
                                                label: "Email ou contacts",
                                                placeholer:
                                                    "Date et heure de départ",
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: Helper.PADDING / 2),
                                        Expanded(
                                            child: MyTextField(
                                          label: "Message",
                                          placeholer: "Date et heure de départ",
                                          maxlines: 9,
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: Helper.PADDING),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const FormSecondaryButton(
                                            title: "Annuler"),
                                        const SizedBox(
                                          width: Helper.PADDING / 2,
                                        ),
                                        FormMainButton(
                                            onTap: () {
                                              Get.toNamed("/");
                                            },
                                            title: "Valider")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Helper.PADDING),
                        Container(
                          width: double.infinity,
                          height: Get.size.height,
                          color: Colors.blue,
                        ),
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
          const HeaderMenu(),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
