import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/inderline_button.dart';
import 'package:ancrage/components/secondary_button.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Pack.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackBoxMini extends StatefulWidget {
  final GlobalKey key_value;
  final Pack pack;
  final bool initiallyExpanded;
  const PackBoxMini(
      {super.key,
      required this.key_value,
      required this.initiallyExpanded,
      required this.pack});

  @override
  State<PackBoxMini> createState() => _PackBoxMiniState();
}

class _PackBoxMiniState extends State<PackBoxMini> {
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
          SizedBox(
              height: 40,
              width: 40,
              child: Center(
                  child: Icon(iconValue ? Icons.add : Icons.close,
                      color: AppColor.orange)))
        ],
      ),
      decoration: const BoxDecoration(
        color: AppColor.background,
      ),
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                ApiService.MEDIA_URL + widget.pack.image,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: Helper.PADDING / 2,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: Helper.PADDING / 3),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                            style: AppTextStyle.bodysmall
                                .copyWith(letterSpacing: -1)),
                        const SizedBox(
                          height: Helper.PADDING / 4,
                        ),
                        InderlineButton2(
                          onTap: () {},
                          title: "Politique d'annulation",
                        ),
                        const SizedBox(
                          height: Helper.PADDING / 2,
                        ),
                        Row(
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
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (Responsive.isMonitor(context))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              crossAxisCount:
                                  Responsive.isMobileLarge(context) ? 2 : 1,
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
                                              style:
                                                  AppTextStyle.menuButtonText),
                                        ],
                                      ))
                                  .toList()),
                          const SizedBox(
                            height: Helper.PADDING / 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryButton(
                    onTap: () {
                      if (reservationController.debut.value
                          .isAfter(reservationController.fin.value)) {
                        Get.snackbar("Erreur",
                            "Les dates de début et de fin de séjour ne sont pas correctes !",
                            colorText: AppColor.background,
                            backgroundColor: AppColor.orange,
                            icon: const Icon(
                              Icons.add_alert,
                              color: AppColor.background,
                            ),
                            barBlur: 5,
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        reservationController.packSelected.value = widget.pack;
                        Get.toNamed("/reservation_next_2");
                      }
                    },
                    title: Row(
                      children: [
                        Text(
                          "Choisir ce pack".toUpperCase(),
                          style: AppTextStyle.menuButtonText
                              .copyWith(color: AppColor.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
      onTap: () {},
    );
  }
}
