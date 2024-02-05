import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class FormMainButton extends StatelessWidget {
  final Widget title;
  final Function onTap;
  const FormMainButton({
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.orange,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: Helper.PADDING * 0.8, vertical: 15),
          child: title,
        ),
      ),
    );
  }
}
