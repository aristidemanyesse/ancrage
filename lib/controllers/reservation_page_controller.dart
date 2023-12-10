import 'package:get/get.dart';

class ReservationPageController extends GetxController {
  RxBool scrollAscendant = false.obs;
  RxDouble scrollPosition = 0.0.obs;
  RxDouble lastPosition = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    ever(scrollPosition, (value) {
      scrollAscendant.value = scrollPosition.value > lastPosition.value;
      lastPosition.value = value;
    });
  }
}
