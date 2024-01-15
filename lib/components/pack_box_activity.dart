import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackBoxActivity extends StatefulWidget {
  final GlobalKey key_value;
  final bool initiallyExpanded;
  final Activity activity;
  const PackBoxActivity(
      {super.key,
      required this.key_value,
      required this.initiallyExpanded,
      required this.activity});

  @override
  State<PackBoxActivity> createState() => _PackBoxActivityState();
}

class _PackBoxActivityState extends State<PackBoxActivity> {
  ReservationController reservationController = Get.find();
  late bool iconValue = !widget.initiallyExpanded;

  late bool horaire1 = true;
  late bool public = false;

  @override
  Widget build(BuildContext context) {
    return AdvanceExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          iconValue = !value;
        });
        if (value) {
          for (var key in reservationController.listActivitiesKey.keys) {
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
            widget.activity.name,
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
                  child: Image.network(
                ApiService.MEDIA_URL + widget.activity.image,
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
                              style: AppTextStyle.body.copyWith(
                                letterSpacing: 0,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            widget.activity.description,
                            style: AppTextStyle.body.copyWith(
                              letterSpacing: 0,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: Helper.PADDING / 2,
                          ),
                          Row(
                            children: [
                              Text("Horaires: ",
                                  style: AppTextStyle.body.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                    decoration: TextDecoration.underline,
                                  )),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Switch(
                                        hoverColor: Colors.transparent,
                                        inactiveThumbColor: AppColor.white,
                                        inactiveTrackColor: AppColor.background,
                                        value: horaire1,
                                        onChanged: (value) {
                                          setState(() {
                                            horaire1 = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Text("Matin "),
                                ],
                              ),
                              const SizedBox(
                                width: Helper.PADDING / 3,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Switch(
                                        hoverColor: Colors.transparent,
                                        inactiveThumbColor: AppColor.white,
                                        inactiveTrackColor: AppColor.background,
                                        value: !horaire1,
                                        onChanged: (value) {
                                          setState(() {
                                            horaire1 = !value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Text("Soir "),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Helper.PADDING / 2,
                          ),
                          GridView.count(
                            crossAxisCount: 4,
                            childAspectRatio: (8 / 1),
                            controller:
                                ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: widget.activity.prerequis
                                .split(";")
                                .map((item) => Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          item.trim(),
                                          style: AppTextStyle.body.copyWith(
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ))
                                .toList(),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text("Prix en groupe"),
                              const SizedBox(
                                height: Helper.PADDING / 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                      "Voulez-vous faire cette activité en privée ?"),
                                  const SizedBox(
                                    width: Helper.PADDING / 2,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Switch(
                                                hoverColor: Colors.transparent,
                                                value: public,
                                                inactiveThumbColor:
                                                    AppColor.white,
                                                inactiveTrackColor:
                                                    AppColor.background,
                                                onChanged: (value) {
                                                  setState(() {
                                                    public = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          const Text("Oui"),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: Helper.PADDING / 3,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Switch(
                                                hoverColor: Colors.transparent,
                                                inactiveThumbColor:
                                                    AppColor.white,
                                                inactiveTrackColor:
                                                    AppColor.background,
                                                value: !public,
                                                onChanged: (value) {
                                                  setState(() {
                                                    public = !value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          const Text("Non"),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: Helper.PADDING / 2,
                                      ),
                                      Text(
                                        "${public ? widget.activity.privatePrice : widget.activity.publicPrice} Fcfa",
                                        style: AppTextStyle.body.copyWith(
                                            letterSpacing: -1,
                                            color: AppColor.orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
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
                                    reservationController.activitySelected
                                        .value = widget.activity;
                                    reservationController.horaire.value =
                                        horaire1;
                                    reservationController.public.value = public;

                                    Get.toNamed("/reservation_next_3");
                                  },
                                  title: "Choisir cette activité")
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
