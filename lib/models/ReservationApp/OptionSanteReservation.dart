// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:ancrage/models/ReservationApp/OptionSanteReservationSchema.dart';
import 'package:ancrage/models/coreApp/ResponseModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'OptionSanteReservation.freezed.dart';
part 'OptionSanteReservation.g.dart';

@freezed
class OptionSanteReservation with _$OptionSanteReservation {
  const factory OptionSanteReservation({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(Option()) Option option,
  }) = _OptionSanteReservation;

  factory OptionSanteReservation.fromJson(Map<String, Object?> json) =>
      _$OptionSanteReservationFromJson(json);

  static const String OptionSanteReservationFragment = """
  fragment OptionSanteReservationFragment on OptionSanteReservationGenericType {
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
    dynamic datas = await ApiService.request(
        OptionSanteReservationSchema.CREATE, variables);
    bool ok = datas["createOptionSanteReservation"]["ok"];
    if (ok) {
      OptionSanteReservation reservation = OptionSanteReservation.fromJson(
          datas["createOptionSanteReservation"]["optionsantereservation"]);
      response =
          ResponseModel(field: "", message: "", ok: true, data: reservation);
    } else {
      response = ResponseModel(
          field: datas["createOptionSanteReservation"]["errors"][0]["field"],
          message: datas["createOptionSanteReservation"]["errors"][0]
              ["message"],
          ok: false,
          data: const OptionSanteReservation());

      Get.snackbar("Ouups, Erreur !",
          datas["createOptionSanteReservation"]["errors"][0]["messages"]);
    }
    return response;
  }
}
