import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/form_main_button.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Pack.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackBox extends StatefulWidget {
  final GlobalKey key_value;
  final Pack pack;
  final bool initiallyExpanded;
  const PackBox(
      {super.key,
      required this.key_value,
      required this.initiallyExpanded,
      required this.pack});

  @override
  State<PackBox> createState() => _PackBoxState();
}

class _PackBoxState extends State<PackBox> {
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
          for (var key in reservationController.listKey.keys) {
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
            "Package ${widget.pack.name}",
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
          color: AppColor.background,
          border: Border.all(color: AppColor.background, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
          ),
          padding: const EdgeInsets.all(Helper.PADDING / 3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Image.network(
                    ApiService.MEDIA_URL + widget.pack.image,
                    fit: BoxFit.fitHeight,
                  )),
              const SizedBox(
                width: Helper.PADDING,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pack.name,
                                style: AppTextStyle.titleMedium,
                              ),
                              Text(
                                  "${widget.pack.nbreLit} lits | ${widget.pack.modeleLit} | ${widget.pack.superficie} m²",
                                  style: AppTextStyle.body
                                      .copyWith(letterSpacing: -1)),
                            ],
                          ),
                          const Spacer(),
                          InderlineButton2(
                            onTap: () {},
                            title: "Politique d'annulation",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Prix d'ouverture: ",
                            style:
                                AppTextStyle.body.copyWith(letterSpacing: -1),
                          ),
                          Text(
                            "${widget.pack.price} FCFA",
                            style: AppTextStyle.titleSmall.copyWith(
                                color: AppColor.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: Helper.PADDING / 3),
                        child: const Divider(),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "INCLUT :",
                                  style: AppTextStyle.subtitle
                                      .copyWith(letterSpacing: 0),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Helper.PADDING / 5,
                            ),
                            GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: (8 / 1),
                                controller:
                                    ScrollController(keepScrollOffset: false),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: widget.pack.inclus
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
                                            Text(item.trim(),
                                                style: AppTextStyle
                                                    .menuButtonText),
                                          ],
                                        ))
                                    .toList()),
                            const SizedBox(
                              height: Helper.PADDING / 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FormMainButton(
                                    onTap: () {
                                      reservationController.packSelected.value =
                                          widget.pack;
                                      Get.toNamed("/reservation_next_2");
                                    },
                                    title: "Choisir ce pack")
                              ],
                            ),
                          ],
                        ),
                      )
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
