import 'package:ancrage/main.dart';
import 'package:ancrage/components/social_button.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key, required this.title});

  final String title;

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  _launchURL(String lien) async {
    final Uri url = Uri.parse(lien);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Responsive(
                      desktop: SvgPicture.asset(
                        "assets/images/main/Logo-Lancrage.svg",
                      ),
                      mobile: SvgPicture.asset(
                        "assets/images/main/Logo-Lancrage.svg",
                        height: 250,
                      ),
                    ),
                    SizedBox(
                      height: Helper.distance,
                    ),
                    const Text(
                      "VOTRE PREMIER ÉCOLODGE DE LUXE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.wihite,
                          fontSize: 20,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: Helper.distance / 2,
                    ),
                    const Text(
                      "RESERVATION A PARTIR DU 10 JANVIER 2024",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.wihite,
                          fontSize: 13,
                          fontWeight: FontWeight.w100),
                    ),
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
                  )
                ],
              ),
              SizedBox(
                height: Helper.distance * 5,
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
