import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const SecondaryButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          color: AppColor.orange,
          padding: const EdgeInsets.symmetric(
              horizontal: Helper.PADDING * 2, vertical: Helper.PADDING / 3),
          child: Text(
            title.toUpperCase(),
            style: AppTextStyle.menuButtonText.copyWith(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
