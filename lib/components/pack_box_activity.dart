import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackBoxActivity extends StatefulWidget {
  final GlobalKey key_value;
  final bool initiallyExpanded;
  const PackBoxActivity(
      {super.key, required this.key_value, required this.initiallyExpanded});

  @override
  State<PackBoxActivity> createState() => _PackBoxActivityState();
}

class _PackBoxActivityState extends State<PackBoxActivity> {
  ReservationController reservationController = Get.find();
  late bool iconValue = !widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return AdvanceExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          iconValue = !value;
        });
        if (value) {
          for (var key in reservationController.listKey) {
            if (key != widget.key_value) {
              key.currentState?.collapse();
            }
          }
        }
      },
      maintainState: true,
      initiallyExpanded: widget.initiallyExpanded,
      textColor: AppColor.textColor,
      collapsedTextColor: AppColor.textColor,
      hideIcon: true,
      key: widget.key_value,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Package village + Navette point relais à Abidjan",
            style: AppTextStyle.subtitle,
          ),
          Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColor.orange)),
              child: Center(
                  child: Icon(iconValue ? Icons.add : Icons.close,
                      color: AppColor.orange)))
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.background, width: 2),
      ),
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColor.white,
              border: Border(
                  top: BorderSide(color: AppColor.background, width: 1))),
          padding: const EdgeInsets.all(Helper.PADDING / 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Image.asset(
                "assets/images/bg/facade.png",
                fit: BoxFit.fitHeight,
              )),
              const SizedBox(
                width: Helper.PADDING / 2,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Helper.PADDING / 2),
                            child: Text(
                              "Description :",
                              style: AppTextStyle.subtitle
                                  .copyWith(letterSpacing: 0),
                            ),
                          ),
                          Text(
                            "ther exception was thrown: Multiple widgets used the same Globather exception was thrown: Multiple widgets used the same Globather exception was thrown: Multiple widgets used the same Globather exception was thrown: Multiple widgets used the same Globather exception was thrown: Multiple widgets used the same Globather exception was thrown: Multiple widgets used the same Globa ",
                            style: AppTextStyle.body.copyWith(letterSpacing: 0),
                          ),
                          CheckboxListTile(
                            title: const Text("title text"),
                            value: false,
                            onChanged: (newValue) {
                              setState(() {});
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          const SizedBox(
                            height: Helper.PADDING / 5,
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: Helper.PADDING / 5,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Prix en groupe"),
                              SizedBox(
                                height: Helper.PADDING / 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "Voulez-vous faire cette activité en privée ?"),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: Helper.PADDING / 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FormMainButton(
                                  onTap: () {
                                    Get.toNamed("/reservation_next");
                                  },
                                  title: "Reserver")
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
      onTap: () {},
    );
  }
}
