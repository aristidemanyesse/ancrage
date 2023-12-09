import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  const MainButton({
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.black, width: 2)),
          child: Text(
            title.toUpperCase(),
            style: AppTextStyle.menuButtonText,
          ),
        ),
      ),
    );
  }
}