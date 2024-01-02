import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String placeholer;
  final String label;
  final int maxlines;
  final TextInputType keyboardType;

  const MyTextField(
      {super.key,
      required this.placeholer,
      required this.label,
      this.maxlines = 1,
      this.keyboardType = TextInputType.text});

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
          keyboardType: keyboardType,
          maxLines: maxlines,
          inputFormatters: keyboardType == TextInputType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : [],
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
