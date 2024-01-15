import 'package:ancrage/models/HotelApp/CategoryOption.dart';
import 'package:get/get.dart';

class OptionController extends GetxController {
  RxList<CategoryOption> groupes = RxList<CategoryOption>([]);

  @override
  void onInit() async {
    super.onInit();

    groupes.value = await CategoryOption.all({});
  }
}
