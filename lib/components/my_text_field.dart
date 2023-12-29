import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class MyTextField extends StatelessWidget {
  final String placeholer;
  final String label;
  final int maxlines;

  const MyTextField(
      {super.key,
      required this.placeholer,
      required this.label,
      this.maxlines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: AppTextStyle.label,
          ),
        ),
        TextField(
          maxLines: maxlines,
          decoration: InputDecoration(
            hintText: placeholer,
            hintStyle: AppTextStyle.placeholder,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 2.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
