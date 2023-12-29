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
    @Default(0) int publicPrice,
    @Default(0) int privatePrice,
    @Default("") String description,
    @Default("") String prerequis,
    @Default("") String image,
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
    publicPrice
    privatePrice
    description
    prerequis
    image
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
