import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: Helper.PADDING),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            ontap();
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: SvgPicture.asset(
              path,
            ),
          ),
        ),
      ),
    ).animate().fade(delay: 500.ms, duration: 600.ms).slide(
        delay: 500.ms,
        begin: const Offset(0.0, 1),
        curve: Curves.easeIn,
        duration: 600.ms);
  }
}
