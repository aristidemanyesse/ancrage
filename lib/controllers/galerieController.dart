import 'package:ancrage/models/HotelApp/Album.dart';
import 'package:get/get.dart';

class GalerieController extends GetxController {
  RxList<Album> albums = RxList<Album>([]);

  @override
  void onInit() async {
    super.onInit();

    albums.value = await Album.all({});
  }
}
