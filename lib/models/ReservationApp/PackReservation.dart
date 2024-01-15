// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Pack.dart';
import 'package:ancrage/models/ReservationApp/PackReservationSchema.dart';
import 'package:ancrage/models/coreApp/ResponseModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'PackReservation.freezed.dart';
part 'PackReservation.g.dart';

@freezed
class PackReservation with _$PackReservation {
  const factory PackReservation({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(0) int price,
    @Default(Pack()) Pack pack,
  }) = _PackReservation;

  factory PackReservation.fromJson(Map<String, Object?> json) =>
      _$PackReservationFromJson(json);

  static const String PackReservationFragment = """
  fragment PackReservationFragment on PackReservationGenericType {
    id
    createdAt
    updateAt
    deleted
    price
    pack{
      ...PackFragment
    }
  }
  """;

  static Future<ResponseModel> create(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(PackReservationSchema.CREATE, variables);
    bool ok = datas["createPackReservation"]["ok"];
    if (ok) {
      PackReservation reservation = PackReservation.fromJson(
          datas["createPackReservation"]["packreservation"]);
      response =
          ResponseModel(field: "", message: "", ok: true, data: reservation);
    } else {
      response = ResponseModel(
          field: datas["createPackReservation"]["errors"][0]["field"],
          message: datas["createPackReservation"]["errors"][0]["message"],
          ok: false,
          data: const PackReservation());

      Get.snackbar("Ouups, Erreur !",
          datas["createPackReservation"]["errors"][0]["message"]);
    }
    return response;
  }
}
