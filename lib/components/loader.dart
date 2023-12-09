import 'dart:math';

import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(seconds: 2, microseconds: 500), vsync: this);
    _animation = Tween<double>(
      begin: 0,
      end: 250,
    ).animate(_controller);
    Future.delayed(const Duration(seconds: 1)).then((value) => _controller.forward());

    _controller2 =
        AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    _animation2 = Tween<double>(
      begin: 0,
      end: -70,
    ).animate(_controller2);

    Future.delayed(const Duration(seconds: 1))
        .then((value) => _controller2.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(1),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 250,
              width: 250,
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Container(
                          height: _animation.value,
                          width: 200,
                          color: AppColor.green,
                        );
                      }),
                  Image.asset(
                    'assets/images/bg/Logo-Lancrage-_-Light-002.png',
                    height: max(
                        300, min(MediaQuery.of(context).size.width / 4, 200)),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation2.value),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Text(
                        "L'ANCRAGE",
                        style: GoogleFonts.tenorSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 2),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
