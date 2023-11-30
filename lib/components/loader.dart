import 'dart:math';

import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(1),
      body: Center(
        child: Lottie.asset(
          'assets/lotties/Ancrage.json',
          height: max(200, min(MediaQuery.of(context).size.width / 4, 300)),
        ),
      ),
    );
  }
}
