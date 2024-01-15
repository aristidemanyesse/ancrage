import 'package:ancrage/models/HotelApp/Pack.dart';
import 'package:ancrage/models/ReservationApp/PackReservation.dart';

class PackReservationSchema {
  static const String ALL = r"""
    query () {
      searchPackReservation(
        deleted: false
      ) {
        results {
          ...PackReservationFragment
        }
      }
    }
  """ +
      PackReservation.PackReservationFragment +
      Pack.PackFragment;

  static const String CREATE = r"""
    mutation ($reservation : ID!, $pack :ID!, $price:Int){
      createPackReservation(newPackreservation : {
          reservation : $reservation,
          price : $price,
          pack: $pack,
        }){
          ok
          errors{
            field
            messages
          }
          packreservation{
            ...PackReservationFragment
          }
        }
      }
  """ +
      PackReservation.PackReservationFragment +
      Pack.PackFragment;
}
