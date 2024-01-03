import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  RxList<Activity> activities = RxList<Activity>([]);

  @override
  void onInit() async {
    super.onInit();

    activities.value = await Activity.all({});
  }
}
