import 'package:ancrage/components/loader.dart';
import 'package:get/get.dart';

class LoaderController extends GetxController {
  RxBool wait = false.obs;

  @override
  void onInit() {
    wait.value = true;
    super.onInit();
  }

  void start() {
    Get.dialog(const Loader());
  }

  void stop() {
    Get.back();
  }
}
