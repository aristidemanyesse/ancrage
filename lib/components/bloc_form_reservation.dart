import 'package:ancrage/components/my_date_field.dart';
import 'package:ancrage/components/my_text_field.dart';
import 'package:ancrage/controllers/reservationController.dart';
import 'package:ancrage/utils/responsive.dart';
import 'package:ancrage/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlocFormReservation extends StatefulWidget {
  const BlocFormReservation({
    super.key,
    required this.reservationController,
    required this.debutController,
    required this.finController,
    required this.nbrChambreController,
    required this.nbrPersonneController,
  });

  final ReservationController reservationController;
  final TextEditingController debutController;
  final TextEditingController finController;
  final TextEditingController nbrChambreController;
  final TextEditingController nbrPersonneController;

  @override
  State<BlocFormReservation> createState() => _BlocFormReservationState();
}

class _BlocFormReservationState extends State<BlocFormReservation> {
  DateFormat dateFormat = DateFormat('dd MMMM yyy – kk:mm');

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          (Responsive.isMobileLarge(context) || Responsive.isMobile(context))
              ? 520
              : 400,
      padding: EdgeInsets.symmetric(
          horizontal: (Responsive.isMobileLarge(context) ||
                  Responsive.isMobile(context))
              ? Helper.PADDING / 3
              : Helper.PADDING * 2,
          vertical: Helper.PADDING / 2),
      decoration: BoxDecoration(
          border: (Responsive.isMobileLarge(context) ||
                  Responsive.isMobile(context))
              ? null
              : Border.all(width: 3, color: AppColor.background)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Réservation",
            style: (Responsive.isMobileLarge(context) ||
                    Responsive.isMobile(context))
                ? AppTextStyle.titleLarge
                : AppTextStyle.titleMedium,
          ),
          const Spacer(),
          Responsive(
            mobile: Column(
              children: [
                MyDateField(
                  controller: widget.debutController,
                  onChanged: (DateTime date) {
                    widget.reservationController.debut.value = date;
                    widget.debutController.text = dateFormat.format(date);
                  },
                  label: "Arrivée",
                  placeholer: "Date et heure d'arrivée",
                ),
                const SizedBox(
                  height: Helper.PADDING / 3,
                ),
                MyDateField(
                  controller: widget.finController,
                  onChanged: (DateTime date) {
                    widget.reservationController.fin.value = date;
                    widget.finController.text = dateFormat.format(date);
                  },
                  label: "Départ",
                  placeholer: "Date et heure de départ",
                ),
                const SizedBox(
                  height: Helper.PADDING / 3,
                ),
                MyTextField(
                  onChanged: (String value) {
                    if (int.parse(value) > 0) {
                      widget.reservationController.nbrPersonne.value =
                          int.parse(value);
                    } else {
                      setState(() {
                        widget.nbrPersonneController.text = "1";
                      });
                    }
                  },
                  controller: widget.nbrPersonneController,
                  label: "Personnes",
                  placeholer: "Nombre de personnes",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: Helper.PADDING / 3,
                ),
                MyTextField(
                  onChanged: (String value) {
                    if (int.parse(value) > 0) {
                      widget.reservationController.nbrChambre.value =
                          int.parse(value);
                    } else {
                      setState(() {
                        widget.nbrChambreController.text = "1";
                      });
                    }
                  },
                  controller: widget.nbrChambreController,
                  label: "Chambres",
                  placeholer: "Nombre de chambres",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: Helper.PADDING / 2,
                ),
              ],
            ),
            tablet: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: MyDateField(
                      controller: widget.debutController,
                      onChanged: (DateTime date) {
                        widget.reservationController.debut.value = date;
                        widget.debutController.text = dateFormat.format(date);
                      },
                      label: "Arrivée",
                      placeholer: "Date et heure d'arrivée",
                    )),
                    const SizedBox(
                      width: Helper.PADDING / 2,
                    ),
                    Expanded(
                        child: MyDateField(
                      controller: widget.finController,
                      onChanged: (DateTime date) {
                        widget.reservationController.fin.value = date;
                        widget.finController.text = dateFormat.format(date);
                      },
                      label: "Départ",
                      placeholer: "Date et heure de départ",
                    )),
                  ],
                ),
                const SizedBox(
                  height: Helper.PADDING / 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        onChanged: (String value) {
                          if (int.parse(value) > 0) {
                            widget.reservationController.nbrPersonne.value =
                                int.parse(value);
                          } else {
                            setState(() {
                              widget.nbrPersonneController.text = "1";
                            });
                          }
                        },
                        controller: widget.nbrPersonneController,
                        label: "Personnes",
                        placeholer: "Nombre de personnes",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: Helper.PADDING / 2,
                    ),
                    Expanded(
                        child: MyTextField(
                      onChanged: (String value) {
                        if (int.parse(value) > 0) {
                          widget.reservationController.nbrChambre.value =
                              int.parse(value);
                        } else {
                          setState(() {
                            widget.nbrChambreController.text = "1";
                          });
                        }
                      },
                      controller: widget.nbrChambreController,
                      label: "Chambres",
                      placeholer: "Nombre de chambres",
                      keyboardType: TextInputType.number,
                    )),
                  ],
                ),
              ],
            ),
            desktop: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: MyDateField(
                      controller: widget.debutController,
                      onChanged: (DateTime date) {
                        widget.reservationController.debut.value = date;
                        widget.debutController.text = dateFormat.format(date);
                      },
                      label: "Arrivée",
                      placeholer: "Date et heure d'arrivée",
                    )),
                    const SizedBox(
                      width: Helper.PADDING / 2,
                    ),
                    Expanded(
                        child: MyDateField(
                      controller: widget.finController,
                      onChanged: (DateTime date) {
                        widget.reservationController.fin.value = date;
                        widget.finController.text = dateFormat.format(date);
                      },
                      label: "Départ",
                      placeholer: "Date et heure de départ",
                    )),
                  ],
                ),
                const SizedBox(
                  height: Helper.PADDING / 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        onChanged: (String value) {
                          if (int.parse(value) > 0) {
                            widget.reservationController.nbrPersonne.value =
                                int.parse(value);
                          } else {
                            setState(() {
                              widget.nbrPersonneController.text = "1";
                            });
                          }
                        },
                        controller: widget.nbrPersonneController,
                        label: "Personnes",
                        placeholer: "Nombre de personnes",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: Helper.PADDING / 2,
                    ),
                    Expanded(
                        child: MyTextField(
                      onChanged: (String value) {
                        if (int.parse(value) > 0) {
                          widget.reservationController.nbrChambre.value =
                              int.parse(value);
                        } else {
                          setState(() {
                            widget.nbrChambreController.text = "1";
                          });
                        }
                      },
                      controller: widget.nbrChambreController,
                      label: "Chambres",
                      placeholer: "Nombre de chambres",
                      keyboardType: TextInputType.number,
                    )),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
