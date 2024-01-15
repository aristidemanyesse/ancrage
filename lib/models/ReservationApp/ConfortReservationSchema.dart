import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:ancrage/models/ReservationApp/ConfortReservation.dart';

class ConfortReservationSchema {
  static const String ALL = r"""
    query () {
      searchConfortReservation(
        deleted: false
      ) {
        results {
          ...ConfortReservationFragment
        }
      }
    }
  """ +
      ConfortReservation.ConfortReservationFragment +
      Option.OptionFragment;

  static const String CREATE = r"""
    mutation ($reservation : ID!, $option :ID!){
      createConfortReservation(newConfortreservation : {
          reservation : $reservation,
          option: $option,
        }){
          ok
          errors{
            field
            messages
          }
          confortreservation{
            ...ConfortReservationFragment
          }
        }
      }
  """ +
      ConfortReservation.ConfortReservationFragment +
      Option.OptionFragment;
}
