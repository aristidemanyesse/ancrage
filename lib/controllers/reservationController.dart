import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  final List<GlobalKey<AdvanceExpansionTileState>> listKey = [
    GlobalKey<AdvanceExpansionTileState>(),
    GlobalKey<AdvanceExpansionTileState>(),
    GlobalKey<AdvanceExpansionTileState>(),
  ];

}
