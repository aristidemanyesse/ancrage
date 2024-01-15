// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/Activity.dart';
import 'package:ancrage/models/ReservationApp/ActivityReservationSchema.dart';
import 'package:ancrage/models/coreApp/ResponseModel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'ActivityReservation.freezed.dart';
part 'ActivityReservation.g.dart';

@freezed
class ActivityReservation with _$ActivityReservation {
  const factory ActivityReservation({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default(0) int price,
    @Default(true) bool isPublic,
    @Default(Activity()) Activity activity,
  }) = _ActivityReservation;

  factory ActivityReservation.fromJson(Map<String, Object?> json) =>
      _$ActivityReservationFromJson(json);

  static const String ActivityReservationFragment = """
  fragment ActivityReservationFragment on ActivityReservationGenericType {
    id
    createdAt
    updateAt
    deleted
    price
    isPublic
    activity{
      ...ActivityFragment
    }
  }
  """;

  static Future<ResponseModel> create(Map<String, dynamic> variables) async {
    ResponseModel response;
    dynamic datas =
        await ApiService.request(ActivityReservationSchema.CREATE, variables);
    bool ok = datas["createActivityReservation"]["ok"];
    if (ok) {
      ActivityReservation reservation = ActivityReservation.fromJson(
          datas["createActivityReservation"]["activityreservation"]);
      response =
          ResponseModel(field: "", message: "", ok: true, data: reservation);
    } else {
      response = ResponseModel(
          field: datas["createActivityReservation"]["errors"][0]["field"],
          message: datas["createActivityReservation"]["errors"][0]["messages"],
          ok: false,
          data: const ActivityReservation());

      Get.snackbar("Ouups, Erreur !",
          datas["createActivityReservation"]["errors"][0]["messages"]);
    }
    return response;
  }
}
