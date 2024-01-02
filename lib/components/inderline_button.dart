import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class InderlineButton extends StatelessWidget {
  final String title;
  final Function ontap;

  const InderlineButton({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Text(title,
            style: AppTextStyle.textsub.copyWith(
                color: AppColor.orange,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.orange,
                decorationThickness: 1)),
      ),
    );
  }
}

class InderlineButton2 extends StatelessWidget {
  final String title;
  final Function onTap;

  const InderlineButton2({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(title,
            style: AppTextStyle.bodysmall.copyWith(
                color: AppColor.orange,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.orange,
                fontSize: 16,
                decorationThickness: 1)),
      ),
    );
  }
}
