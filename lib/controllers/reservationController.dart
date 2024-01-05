import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:ancrage/models/HotelApp/Pack.dart';
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
  Rx<DateTime> debut = DateTime.now().obs;
  Rx<DateTime> fin = DateTime.now().add(const Duration(days: 1)).obs;
  RxInt montant = 0.obs;
  RxInt nbrChambre = 1.obs;
  RxInt nbrPersonne = 1.obs;
  RxBool public = true.obs;
  RxBool horaire = false.obs;

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
    montant.value += packSelected.value.price * nbre_days() * nbrChambre.value;
    montant.value += public.value
        ? activitySelected.value.publicPrice
        : activitySelected.value.privatePrice;
  }

  int nbre_days() {
    return fin.value.difference(debut.value).inDays;
  }
}
