import 'package:get/get.dart';

class ConnexionController extends GetxController {
  RxBool isConnected = true.obs;

  @override
  void onInit() async {
    // isConnected.value = await InternetConnectionChecker().hasConnection;
    execute();
    super.onInit();
  }

  Future<void> execute() async {
    isConnected.value = true;
    // InternetConnectionChecker().onStatusChange.listen(
    //   (InternetConnectionStatus status) {
    //     switch (status) {
    //       case InternetConnectionStatus.connected:
    //         isConnected.value = true;
    //         break;
    //       case InternetConnectionStatus.disconnected:
    //         isConnected.value = false;
    //         break;
    //     }
    //   },
    // );
  }
}
