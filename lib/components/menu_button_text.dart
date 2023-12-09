import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class MenuButtonText extends StatelessWidget {
  final String title;
  final Color color;
  const MenuButtonText(
      {super.key, required this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        child: Text(
          title.toUpperCase(),
          style: AppTextStyle.menuButtonText.copyWith(color: color),
        ),
      ),
    );
  }
}
