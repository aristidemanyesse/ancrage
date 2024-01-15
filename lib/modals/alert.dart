import 'dart:ui';

import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertModal extends StatefulWidget {
  final String title;
  final String message;
  final Function onClick;

  const AlertModal(
      {super.key,
      required this.title,
      required this.message,
      required this.onClick});

  @override
  State<AlertModal> createState() => _AlertModalState();
}

class _AlertModalState extends State<AlertModal> {
  LoaderController loaderController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        child: Container(
          color: AppColor.background.withOpacity(0.1),
          child: Center(
            child: Container(
              height: Get.size.height / 3,
              width: Get.width / 3,
              color: AppColor.background,
              padding: const EdgeInsets.symmetric(
                  horizontal: Helper.PADDING, vertical: Helper.PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyle.titleSmall,
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: Helper.PADDING),
                    child: Text(
                      widget.message,
                      style: AppTextStyle.label,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SecondaryButton(
                          onTap: () {
                            widget.onClick();
                          },
                          title: "Ok "),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
