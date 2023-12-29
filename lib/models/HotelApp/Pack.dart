// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/PackSchema.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Pack.freezed.dart';
part 'Pack.g.dart';

@freezed
class Pack with _$Pack {
  const factory Pack({
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
  }) = _Pack;

  factory Pack.fromJson(Map<String, Object?> json) => _$PackFromJson(json);

  static const String PackFragment = """
  fragment PackFragment on PackGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    price
    nbreLit
    superficie
    modeleLit
    inclus
    image
  }
  """;

  static Future<List<Pack>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(PackSchema.ALL, variables);
    List<Pack> items = [];
    for (var jsonTask in datas["searchPack"]["results"]) {
      items.add(Pack.fromJson(jsonTask));
    }
    return items;
  }
}
