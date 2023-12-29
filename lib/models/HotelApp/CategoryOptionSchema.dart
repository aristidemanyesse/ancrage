import 'package:ancrage/models/HotelApp/CategoryOption.dart';
import 'package:ancrage/models/HotelApp/Option.dart';

class CategoryOptionSchema {
  static const String ALL = r"""
    query ($edition: UUID,) {
      searchCategoryOption(
        deleted: false
      ) {
        results {
          ...CategoryOptionFragment
        }
      }
    }
  """ +
      CategoryOption.CategoryOptionFragment +
      Option.OptionFragment;
}
