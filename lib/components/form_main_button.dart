import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class FormMainButton extends StatelessWidget {
  final String title;
  const FormMainButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.orange,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          child: Text(
            title,
            style: AppTextStyle.menuButtonText.copyWith(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
