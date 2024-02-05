import 'package:advance_expansion_tile/advance_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController with RouteAware {
  RxBool scrollAscendant = false.obs;
  RxDouble scrollPosition = 0.0.obs;
  RxDouble lastPosition = 0.0.obs;

  RxBool drawerState = false.obs;

  Map<String, Locale> languages = {
    "Français": const Locale('fr', 'Fr'),
    "English": const Locale('en', 'US')
  };
  RxString languageSelected = "Français".obs;

  final List<GlobalKey<AdvanceExpansionTileState>> listKey = [
    GlobalKey<AdvanceExpansionTileState>(),
    GlobalKey<AdvanceExpansionTileState>(),
    GlobalKey<AdvanceExpansionTileState>(),
  ];

  @override
  void onInit() {
    super.onInit();

    ever(scrollPosition, (value) {
      scrollAscendant.value = !(scrollPosition.value > lastPosition.value);
      lastPosition.value = value;
    });
    ever(languageSelected, (value) {
      Get.updateLocale(languages[languageSelected.value]!);
    });
  }
}
