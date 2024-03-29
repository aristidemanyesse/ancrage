import 'package:flutter/widgets.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;
  final Widget? monitor;

  const Responsive({
    super.key,
    required this.mobile,
    this.mobileLarge,
    this.tablet,
    this.monitor,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width > 500 &&
      MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 700 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1024 &&
      MediaQuery.of(context).size.width < 1440;

  static bool isMonitor(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 1440) {
      return monitor ?? desktop;
    } else if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 768 && tablet != null) {
      return tablet!;
    } else if (size.width >= 450 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}
