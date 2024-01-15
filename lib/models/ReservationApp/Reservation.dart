// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/ReservationApp/ReservationSchema.dart';
import 'package:ancrage/models/coreApp/ResponseModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'Reservation.freezed.dart';
part 'Reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  const Reservation._();

  const factory Reservation({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(0) int price,
    @Default("") String debut,
    @Default("") String fin,
    @Default(0) int personne,
    @Default(0) int chambre,
    @Default("") String clientCivility,
    @Default("") String clientName,
    @Default("") String clientEmail,
    @Default("") String clientContact,
    @Default(false) bool isAllergie,
    @Default("") String allergies,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, Object?> json) =>
      _$ReservationFromJson(json);

  static const String ReservationFragment = """
  fragment ReservationFragment on ReservationGenericType {
    id
    createdAt
    updateAt
    deleted
    price
    debut
    fin
    personne
    chambre
    clientCivility
    clientName
    clientEmail
    clientContact
    isAllergie
    allergies
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

  static Future<ResponseModel> createReservation(
      Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas = await ApiService.request(
        ReservationSchema.CREATE_RESERVATION, variables);
    bool ok = datas["createReservation"]["ok"];
    if (ok) {
      Reservation reservation =
          Reservation.fromJson(datas["createReservation"]["reservation"]);
      response =
          ResponseModel(field: "", message: "", ok: true, data: reservation);
    } else {
      response = ResponseModel(
          field: datas["createReservation"]["errors"][0]["field"],
          message: datas["createReservation"]["errors"][0]["message"],
          ok: false,
          data: const Reservation());

      Get.snackbar("Ouups, Erreur !",
          datas["createReservation"]["errors"][0]["message"]);
    }
    return response;
  }
}
