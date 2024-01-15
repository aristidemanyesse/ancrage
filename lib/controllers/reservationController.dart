import 'dart:math';

import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/components/loader.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:ancrage/models/HotelApp/Pack.dart';
import 'package:ancrage/models/ReservationApp/ActivityReservation.dart';
import 'package:ancrage/models/ReservationApp/ConfortReservation.dart';
import 'package:ancrage/models/ReservationApp/OptionSanteReservation.dart';
import 'package:ancrage/models/ReservationApp/PackReservation.dart';
import 'package:ancrage/models/ReservationApp/Reservation.dart';
import 'package:ancrage/models/coreApp/ResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  RxList<Pack> packs = RxList<Pack>([]);
  RxList<Activity> activities = RxList<Activity>([]);
  final Map<GlobalKey<AdvanceExpansionTileState>, Pack> listKey = {};
  final Map<GlobalKey<AdvanceExpansionTileState>, Activity> listActivitiesKey =
      {};

  Rx<Pack> packSelected = const Pack().obs;
  Rx<Activity> activitySelected = const Activity().obs;
  RxList<Option> optionsSelected = RxList<Option>([]);
  RxList<Option> careSelected = RxList<Option>([]);
  Rx<DateTime> debut = DateTime.now().obs;
  Rx<DateTime> fin = DateTime.now().add(const Duration(days: 1)).obs;
  RxInt montant = 0.obs;
  RxInt jours = 1.obs;
  RxInt nbrChambre = 1.obs;
  RxInt nbrPersonne = 1.obs;
  RxBool public = true.obs;
  RxBool horaire = false.obs;
  RxMap<String, String> client = {"civility": "0"}.obs;
  RxBool isAllergies = false.obs;
  RxString allergies = "".obs;

  @override
  void onInit() async {
    super.onInit();

    packs.value = await Pack.all({});
    if (packs.isNotEmpty) {
      packSelected.value = packs.first;
    }
    for (Pack pack in packs) {
      listKey[GlobalKey<AdvanceExpansionTileState>()] = pack;
    }

    activities.value = await Activity.all({});
    for (Activity activity in activities) {
      listActivitiesKey[GlobalKey<AdvanceExpansionTileState>()] = activity;
    }
    calculMontant();

    ever(packSelected, (value) {
      calculMontant();
    });
    ever(debut, (value) {
      calculMontant();
    });
    ever(fin, (value) {
      calculMontant();
    });
    ever(activitySelected, (value) {
      calculMontant();
    });
    ever(public, (value) {
      calculMontant();
    });
  }

  void calculMontant() {
    montant.value = 0;
    jours.value = max(1, nbre_days());

    montant.value += packSelected.value.price * jours.value * nbrChambre.value;
    montant.value += public.value
        ? activitySelected.value.publicPrice
        : activitySelected.value.privatePrice;
  }

  int nbre_days() {
    return fin.value.difference(debut.value).inDays;
  }

  void save() async {
    Get.dialog(Loader());
    ResponseModel response = await Reservation.createReservation({
      "price": montant.value,
      "debut": debut.value.toString().replaceFirst(" ", "T"),
      "fin": fin.value.toString().replaceFirst(" ", "T"),
      "chambre": nbrChambre.value,
      "personne": nbrPersonne.value,
      "clientCivility": client["civility"],
      "clientName": client["name"],
      "clientEmail": client["email"],
      "clientContact": client["contact"],
      "isAllergie": isAllergies.value,
      "allergies": allergies.value,
    });

    if (response.ok) {
      Reservation reservation = response.data;

      //enregistrement du pack
      ResponseModel packresponse = await PackReservation.create({
        "price": packSelected.value.price,
        "reservation": reservation.id,
        "pack": packSelected.value.id,
      });

      if (packresponse.ok) {
        //enregistrement des activites
        ResponseModel actiresponse = await ActivityReservation.create({
          "price": public.value
              ? activitySelected.value.publicPrice
              : activitySelected.value.privatePrice,
          "reservation": reservation.id,
          "activity": activitySelected.value.id,
          "isPublic": public.value
        });

        if (actiresponse.ok) {
          //enregistrement du confort
          for (Option option in optionsSelected) {
            ResponseModel optiresponse = await ConfortReservation.create(
                {"reservation": reservation.id, "option": option.id});
          }

          //enregistrement du confort
          for (Option option in careSelected) {
            ResponseModel optiresponse = await OptionSanteReservation.create(
                {"reservation": reservation.id, "option": option.id});
          }
        }
      }

      await Future.delayed(Duration(seconds: 3));

      Get.back();

      // Fluttertoast.showToast(
      //         msg:
      //             response.message ?? "Ouups, Produit Veuillez recommencer !",
      //         gravity: ToastGravity.BOTTOM,
      //       );
    }
  }
}
