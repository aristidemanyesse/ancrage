import 'package:ancrage/models/HotelApp/Activity.dart';

class ReservationSchema {
  static const String ALL = r"""
    query () {
      searchActivity(
        deleted: false
      ) {
        results {
          ...ActivityFragment
        }
      }
    }
  """ +
      Activity.ActivityFragment;
}
