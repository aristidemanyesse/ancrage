import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class BlocViewReservation extends StatelessWidget {
  final ReservationController reservationController;
  final DateFormat dateFormat2;

  const BlocViewReservation({
    super.key,
    required this.reservationController,
    required this.dateFormat2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Helper.PADDING / 2,
          horizontal: (Responsive.isMobileLarge(context) ||
                  Responsive.isMobile(context))
              ? Helper.PADDING / 2
              : Helper.PADDING),
      height: (Responsive.isMobile(context)) ? 450 : 400,
      color: AppColor.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Votre Sejour",
            style: AppTextStyle.titleMedium,
          ),
          const Spacer(),
          Responsive(
              mobile: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Arrivée",
                            style: AppTextStyle.subtitle,
                          ),
                          const SizedBox(
                            width: Helper.PADDING / 4,
                          ),
                          Obx(() {
                            return Text(
                              Jiffy.parseFromDateTime(
                                      reservationController.debut.value)
                                  .fromNow(),
                              style: AppTextStyle.subtitle
                                  .copyWith(fontWeight: FontWeight.w500),
                            );
                          })
                        ],
                      ),
                      const SizedBox(
                        height: Helper.PADDING / 5,
                      ),
                      Obx(() {
                        return Text(
                          dateFormat2.format(reservationController.debut.value),
                          style: AppTextStyle.subtitle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        );
                      }),
                      const SizedBox(
                        height: Helper.PADDING / 5,
                      ),
                      Obx(() {
                        return Text(
                          "${reservationController.nbrPersonne} personne${reservationController.nbrPersonne.value > 1 ? "s" : ""}",
                          style: AppTextStyle.subtitle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        );
                      })
                    ],
                  ),
                  const SizedBox(
                    height: Helper.PADDING / 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Départ",
                            style: AppTextStyle.subtitle,
                          ),
                          const SizedBox(
                            width: Helper.PADDING / 4,
                          ),
                          Obx(() {
                            return Text(
                              Jiffy.parseFromDateTime(
                                      reservationController.fin.value)
                                  .fromNow(),
                              style: AppTextStyle.subtitle
                                  .copyWith(fontWeight: FontWeight.w500),
                            );
                          })
                        ],
                      ),
                      const SizedBox(
                        height: Helper.PADDING / 5,
                      ),
                      Obx(() {
                        return Text(
                          dateFormat2.format(reservationController.fin.value),
                          style: AppTextStyle.subtitle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        );
                      }),
                      const SizedBox(
                        height: Helper.PADDING / 5,
                      ),
                      Obx(() {
                        return Text(
                          "${reservationController.nbrChambre} chambre${reservationController.nbrChambre.value > 1 ? "s" : ""}",
                          style: AppTextStyle.subtitle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        );
                      })
                    ],
                  ),
                ],
              ),
              mobileLarge: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Arrivée",
                              style: AppTextStyle.subtitle,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 4,
                            ),
                            Obx(() {
                              return Text(
                                Jiffy.parseFromDateTime(
                                        reservationController.debut.value)
                                    .fromNow(),
                                style: AppTextStyle.subtitle
                                    .copyWith(fontWeight: FontWeight.w500),
                              );
                            })
                          ],
                        ),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            dateFormat2
                                .format(reservationController.debut.value),
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        }),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            "${reservationController.nbrPersonne} personne${reservationController.nbrPersonne.value > 1 ? "s" : ""}",
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        })
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Départ",
                              style: AppTextStyle.subtitle,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 4,
                            ),
                            Obx(() {
                              return Text(
                                Jiffy.parseFromDateTime(
                                        reservationController.fin.value)
                                    .fromNow(),
                                style: AppTextStyle.subtitle
                                    .copyWith(fontWeight: FontWeight.w500),
                              );
                            })
                          ],
                        ),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            dateFormat2.format(reservationController.fin.value),
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        }),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            "${reservationController.nbrChambre} chambre${reservationController.nbrChambre.value > 1 ? "s" : ""}",
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
              desktop: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Arrivée",
                              style: AppTextStyle.subtitle,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 4,
                            ),
                            Obx(() {
                              return Text(
                                Jiffy.parseFromDateTime(
                                        reservationController.debut.value)
                                    .fromNow(),
                                style: AppTextStyle.subtitle
                                    .copyWith(fontWeight: FontWeight.w500),
                              );
                            })
                          ],
                        ),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            dateFormat2
                                .format(reservationController.debut.value),
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        }),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            "${reservationController.nbrPersonne} personne${reservationController.nbrPersonne.value > 1 ? "s" : ""}",
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        })
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Départ",
                              style: AppTextStyle.subtitle,
                            ),
                            const SizedBox(
                              width: Helper.PADDING / 4,
                            ),
                            Obx(() {
                              return Text(
                                Jiffy.parseFromDateTime(
                                        reservationController.fin.value)
                                    .fromNow(),
                                style: AppTextStyle.subtitle
                                    .copyWith(fontWeight: FontWeight.w500),
                              );
                            })
                          ],
                        ),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            dateFormat2.format(reservationController.fin.value),
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        }),
                        const SizedBox(
                          height: Helper.PADDING / 5,
                        ),
                        Obx(() {
                          return Text(
                            "${reservationController.nbrChambre} chambre${reservationController.nbrChambre.value > 1 ? "s" : ""}",
                            style: AppTextStyle.subtitle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 19),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              )),
          const Spacer(
            flex: 2,
          ),
          const Divider(
            height: 5,
            thickness: 1,
            color: AppColor.green,
          ),
          const SizedBox(
            height: Helper.PADDING / 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: Helper.PADDING / 2),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: AppTextStyle.subtitle,
                ),
                const Spacer(),
                Obx(() {
                  return Text(
                    "${reservationController.montant} Xof",
                    style: AppTextStyle.subtitle
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 19),
                  );
                }),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
