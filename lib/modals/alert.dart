
import 'package:ancrage/controllers/LoaderController.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertModal extends StatefulWidget {
  const AlertModal({super.key});

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
      body: Container(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              minWidth: 200,
              maxWidth: Get.size.width * 0.4,
            ),
            decoration: BoxDecoration(
              color: AppColor.background.withOpacity(0.1),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
