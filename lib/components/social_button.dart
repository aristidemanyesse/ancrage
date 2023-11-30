import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String path;
  final Function ontap;

  const SocialButton({
    super.key,
    required this.path,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Helper.distance),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            ontap();
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
