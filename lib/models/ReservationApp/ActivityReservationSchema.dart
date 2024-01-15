import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/models/ReservationApp/ActivityReservation.dart';

class ActivityReservationSchema {
  static const String ALL = r"""
    query () {
      searchActivityReservation(
        deleted: false
      ) {
        results {
          ...ActivityReservationFragment
        }
      }
    }
  """ +
      ActivityReservation.ActivityReservationFragment +
      Activity.ActivityFragment;

  static const String CREATE = r"""
    mutation ($reservation : ID!, $activity :ID!, $price:Int){
      createActivityReservation(newActivityreservation : {
          reservation : $reservation,
          price : $price,
          activity: $activity,
        }){
          ok
          errors{
            field
            messages
          }
          activityreservation{
            ...ActivityReservationFragment
          }
        }
      }
  """ +
      ActivityReservation.ActivityReservationFragment +
      Activity.ActivityFragment;
}
