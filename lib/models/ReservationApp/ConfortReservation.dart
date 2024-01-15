// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:ancrage/models/ReservationApp/ConfortReservationSchema.dart';
import 'package:ancrage/models/coreApp/ResponseModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'ConfortReservation.freezed.dart';
part 'ConfortReservation.g.dart';

@freezed
class ConfortReservation with _$ConfortReservation {
  const factory ConfortReservation({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(Option()) Option option,
  }) = _ConfortReservation;

  factory ConfortReservation.fromJson(Map<String, Object?> json) =>
      _$ConfortReservationFromJson(json);

  static const String ConfortReservationFragment = """
  fragment ConfortReservationFragment on ConfortReservationGenericType {
    id
    createdAt
    updateAt
    deleted
    option{
      ...OptionFragment
    }
  }
  """;

  static Future<ResponseModel> create(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(ConfortReservationSchema.CREATE, variables);
    bool ok = datas["createConfortReservation"]["ok"];
    if (ok) {
      ConfortReservation reservation = ConfortReservation.fromJson(
          datas["createConfortReservation"]["confortreservation"]);
      response =
          ResponseModel(field: "", message: "", ok: true, data: reservation);
    } else {
      response = ResponseModel(
          field: datas["createConfortReservation"]["errors"][0]["field"],
          message: datas["createConfortReservation"]["errors"][0]["messages"],
          ok: false,
          data: const ConfortReservation());

      Get.snackbar("Ouups, Erreur !",
          datas["createConfortReservation"]["errors"][0]["messages"]);
    }
    return response;
  }
}
