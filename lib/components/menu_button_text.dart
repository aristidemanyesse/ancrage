import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class MenuButtonText extends StatelessWidget {
  final String title;
  final Color color;
  final bool active;
  final bool withPadding;
  final Function onTap;

  const MenuButtonText(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.withPadding = true,
      required this.onTap,
      this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: withPadding
          ? const EdgeInsets.only(left: Helper.PADDING * 1.5)
          : null,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            title.toUpperCase(),
            style: AppTextStyle.menuButtonText.copyWith(
                color: color,
                fontWeight: active ? FontWeight.bold : FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
