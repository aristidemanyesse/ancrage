import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class MyDateField extends StatelessWidget {
  final String placeholer;
  final String label;

  const MyDateField({super.key, required this.placeholer, required this.label});

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
          onTap: () async {
            DateTime? dateTime = await showOmniDateTimePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 1)),
              lastDate: DateTime.now().add(
                const Duration(days: 700),
              ),
              is24HourMode: true,
              isShowSeconds: false,
              minutesInterval: 15,
              isForce2Digits: true,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              constraints: const BoxConstraints(
                maxWidth: 350,
                maxHeight: 650,
              ),
              transitionBuilder: (context, anim1, anim2, child) {
                return FadeTransition(
                  opacity: anim1.drive(
                    Tween(
                      begin: 0,
                      end: 1,
                    ),
                  ),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 200),
              barrierDismissible: true,
              selectableDayPredicate: (dateTime) {
                // Disable 25th Feb 2023
                if (dateTime == DateTime(2023, 2, 25)) {
                  return false;
                } else {
                  return true;
                }
              },
            );

            print("dateTime: $dateTime");
          },
          readOnly: true, // Pour rendre le champ de texte en lecture seule
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
            suffixIcon: const Icon(
              Icons.calendar_month,
              color: AppColor.grey,
              size: 20,
            ), // Icône du calendrier à droite
          ),
        ),
      ],
    );
  }
}
