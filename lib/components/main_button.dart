import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color = Colors.black,
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
          padding: Responsive.isMonitor(context)
              ? const EdgeInsets.symmetric(
                  horizontal: Helper.PADDING / 3, vertical: 10)
              : const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: color, width: 2)),
          child: Text(
            title.toUpperCase(),
            style: AppTextStyle.menuButtonText.copyWith(
              color: color,
              fontSize:
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? 17
                      : 20,
            ),
          ),
        ),
      ),
    );
  }
}
