import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class FormSecondaryButton extends StatelessWidget {
  final String title;
  const FormSecondaryButton({
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
              border: Border.all(width: 2, color: AppColor.green)),
          padding: const EdgeInsets.symmetric(
              horizontal: Helper.PADDING * 1.2, vertical: 12),
          child: Text(
            title,
            style: AppTextStyle.menuButtonText.copyWith(color: AppColor.green),
          ),
        ),
      ),
    );
  }
}
