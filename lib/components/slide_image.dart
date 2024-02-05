import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  final String path;
  const SlideImage({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: Responsive.isMonitor(context)
              ? Helper.PADDING
              : Helper.PADDING / 2),
      child: Responsive(
        mobile: Image.asset(
          path,
          height: 500,
          width: 650,
        ),
        mobileLarge: Image.asset(
          path,
          height: 500,
          width: 650,
        ),
        tablet: Image.asset(
          path,
          height: 500,
          width: 650,
        ),
        desktop: Image.asset(
          path,
          height: 300,
          width: 450,
        ),
        monitor: Image.asset(
          path,
          height: 500,
          width: 650,
        ),
      ),
    );
  }
}
