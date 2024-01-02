// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/ReservationApp/ReservationSchema.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Reservation.freezed.dart';
part 'Reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  const factory Reservation({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default(0) int price,
    @Default(0) int nbreLit,
    @Default(0) int superficie,
    @Default("") String modeleLit,
    @Default("") String inclus,
    @Default("") String image,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, Object?> json) =>
      _$ReservationFromJson(json);

  static const String ReservationFragment = """
  fragment ReservationFragment on ReservationGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    price
    nbre_lit
    superficie
    modele_lit
    inclus
    image
  }
  """;

  static Future<List<Reservation>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ReservationSchema.ALL, variables);
    List<Reservation> items = [];
    for (var jsonTask in datas["searchReservation"]["results"]) {
      items.add(Reservation.fromJson(jsonTask));
    }
    return items;
  }
}
