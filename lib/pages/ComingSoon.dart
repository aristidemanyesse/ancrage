import 'dart:math';

import 'package:ancrage/components/loader.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/main.dart';
import 'package:ancrage/components/social_button.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  LoaderController loaderController = Get.find();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      loaderController.wait.value = false;
    });
  }

  _launchURL(String lien) async {
    final Uri url = Uri.parse(lien);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return loaderController.wait.value
          ? Loader()
          : Scaffold(
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
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
                  Column(
                    children: [
                      Spacer(),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SvgPicture.asset(
                              "assets/images/main/Logo-Lancrage.svg",
                              height: max(
                                  150,
                                  min(MediaQuery.of(context).size.width / 4,
                                      300)),
                            )
                                .animate()
                                .fade(delay: 500.ms, duration: 600.ms)
                                .scale(delay: 500.ms, duration: 600.ms),
                            SizedBox(
                              height: Helper.distance,
                            ),
                            Responsive(
                              desktop: Text(
                                "VOTRE PREMIER ÉCOLODGE DE LUXE",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tenorSans(
                                    color: AppColor.wihite,
                                    fontSize: 16,
                                    letterSpacing: 2),
                              ),
                              tablet: Text(
                                "VOTRE PREMIER ÉCOLODGE DE LUXE",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tenorSans(
                                    color: AppColor.wihite,
                                    fontSize: 18,
                                    letterSpacing: 2),
                              ),
                              mobile: Text(
                                "VOTRE PREMIER ÉCOLODGE DE LUXE",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tenorSans(
                                    color: AppColor.wihite,
                                    fontSize: 16,
                                    letterSpacing: 2),
                              ),
                            )
                                .animate()
                                .fade(delay: 500.ms, duration: 600.ms)
                                .scale(
                                    delay: 500.ms,
                                    duration: 600.ms,
                                    begin: Offset(4, 4)),
                            SizedBox(
                              height: Helper.distance / 2,
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Text(
                                "RESERVATION A PARTIR DU 10 JANVIER 2024",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tenorSans(
                                  color: AppColor.wihite,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            )
                                .animate()
                                .fade(delay: 500.ms, duration: 600.ms)
                                .scale(
                                    delay: 500.ms,
                                    duration: 600.ms,
                                    begin: Offset(4, 4)),
                            SizedBox(
                              height: Helper.distance,
                            ),
                            ElevatedButton(
                                    onPressed: () {
                                      _launchURL(
                                          "https://srs5wtylqng.typeform.com/to/c6FMd68P");
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 196, 88, 41),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: -20),
                                        textStyle: GoogleFonts.tenorSans()
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                color: Colors.white)),
                                    child: Text("Liste d'attente"))
                                .animate()
                                .fade(delay: 500.ms, duration: 600.ms)
                                .scale(
                                    delay: 500.ms,
                                    duration: 600.ms,
                                    begin: Offset(4, 4)),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            path: "assets/images/socials/Insta.svg",
                            ontap: () {
                              _launchURL(
                                  "https://instagram.com/lancrage.sassandra?igshid=OGQ5ZDc2ODk2ZA==");
                            },
                          ),
                          SocialButton(
                            path: "assets/images/socials/Facebook.svg",
                            ontap: () {
                              _launchURL(
                                  "https://www.facebook.com/profile.php?id=61550628851948&mibextid=JRoKGi");
                            },
                          ),
                          SocialButton(
                            path: "assets/images/socials/LinkedIn.svg",
                            ontap: () {
                              _launchURL(
                                  "https://www.linkedin.com/company/l-ancrage-sassandra/");
                            },
                          ),
                          SocialButton(
                            path: "assets/images/socials/TiTok.svg",
                            ontap: () {
                              _launchURL(
                                  "https://www.tiktok.com/@lancrage.sassandra?_t=8hlvj2f9t5i&_r=1");
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                    ],
                  ),
                ],
              ),
              // This trailing comma makes auto-formatting nicer for build methods.
            );
    });
  }
}
