import 'package:ancrage/models/ReservationApp/Reservation.dart';

class ReservationSchema {
  static const String ALL = r"""
    query () {
      searchReservation(
        deleted: false
      ) {
        results {
          ...ReservationFragment
        }
      }
    }
  """ +
      Reservation.ReservationFragment;

  static const String CREATE_RESERVATION = r"""
    mutation ($price: Int, $chambre: Int, $personne: Int, $debut: CustomDateTime, $fin: CustomDateTime, $clientName: String, $clientEmail: String, $clientContact: String, $clientCivility: String, $isAllergie: Boolean, $allergies: String) {
      createReservation(
        newReservation: {price: $price, debut: $debut, fin: $fin, chambre: $chambre, personne: $personne, clientCivility: $clientCivility, clientName: $clientName, clientEmail: $clientEmail, clientContact: $clientContact, isAllergie:$isAllergie, allergies:$allergies}
      ) {
        ok
        errors {
          field
          messages
        }
        reservation {
          ...ReservationFragment
        }
      }
    }
  """ +
      Reservation.ReservationFragment;
}
