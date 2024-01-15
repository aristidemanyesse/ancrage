import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:ancrage/models/ReservationApp/OptionSanteReservation.dart';

class OptionSanteReservationSchema {
  static const String ALL = r"""
    query () {
      searchOptionSanteReservation(
        deleted: false
      ) {
        results {
          ...OptionSanteReservationFragment
        }
      }
    }
  """ +
      OptionSanteReservation.OptionSanteReservationFragment +
      Option.OptionFragment;

  static const String CREATE = r"""
    mutation ($reservation : ID!, $option :ID!){
      createOptionSanteReservation(newOptionsantereservation : {
          reservation : $reservation,
          option: $option,
        }){
          ok
          errors{
            field
            messages
          }
          optionsantereservation{
            ...OptionSanteReservationFragment
          }
        }
      }
  """ +
      OptionSanteReservation.OptionSanteReservationFragment +
      Option.OptionFragment;
}
