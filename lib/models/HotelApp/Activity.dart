// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/ActivitySchema.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Activity.freezed.dart';
part 'Activity.g.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default("") String tag,
    @Default(0) int publicPrice,
    @Default(0) int privatePrice,
    @Default("") String description,
    @Default("") String prerequis,
    @Default("") String image,
    @Default("") String image1,
    @Default("") String image2,
    @Default("") String image3,
    @Default("") String image4,
    @Default("") String image5,
    @Default("") String background,
    @Default("") String ittineraire,
    @Default(false) bool choosePublic,
    @Default(true) bool horaire1,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);

  static const String ActivityFragment = """
  fragment ActivityFragment on ActivityGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    tag
    publicPrice
    privatePrice
    description
    prerequis
    image
    image1
    image2
    image3
    image4
    image5
    background
    ittineraire
  }
  """;

  static Future<List<Activity>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ActivitySchema.ALL, variables);
    List<Activity> items = [];
    for (var jsonTask in datas["searchActivity"]["results"]) {
      items.add(Activity.fromJson(jsonTask));
    }
    return items;
  }
}
