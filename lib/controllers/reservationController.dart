import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
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
  Rx<DateTime> debut = DateTime.now().obs;
  Rx<DateTime> fin = DateTime.now().add(const Duration(days: 1)).obs;
  RxInt montant = 0.obs;

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
  }

  void calculMontant() {
    montant.value = 0;
    montant.value += packSelected.value.price * nbre_days();
  }

  int nbre_days() {
    return debut.value.difference(fin.value).inDays;
  }
}
