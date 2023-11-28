import 'package:ancrage/main.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
                    SvgPicture.asset(
                      "assets/images/main/Logo-Lancrage.svg",
                    ),
                    SizedBox(
                      height: Helper.distance,
                    ),
                    const Text(
                      "VOTRE PREMIER ÉCOLODGE DE LUXE",
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
                  ),
                  SocialButton(
                    path: "assets/images/socials/Facebook.svg",
                  ),
                  SocialButton(
                    path: "assets/images/socials/LinkedIn.svg",
                  ),
                  SocialButton(
                    path: "assets/images/socials/TiTok.svg",
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

class SocialButton extends StatelessWidget {
  final String path;

  const SocialButton({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Helper.distance),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            print("000000000");
          },
          child: Container(
            width: 50,
            height: 50,
            child: SvgPicture.asset(
              path,
            ),
          ),
        ),
      ),
    );
  }
}
