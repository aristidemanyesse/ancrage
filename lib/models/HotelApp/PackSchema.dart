import 'package:ancrage/models/HotelApp/Pack.dart';

class PackSchema {
  static const String ALL = r"""
    query ($edition: UUID,) {
      searchPack(
        deleted: false
      ) {
        results {
          ...PackFragment
        }
      }
    }
  """ +
      Pack.PackFragment;
}
