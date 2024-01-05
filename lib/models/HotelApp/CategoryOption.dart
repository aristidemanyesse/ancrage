// This file is "main.dart"
import 'package:ancrage/core/apiservice.dart';
import 'package:ancrage/models/HotelApp/CategoryOptionSchema.dart';
import 'package:ancrage/models/HotelApp/Option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CategoryOption.freezed.dart';
part 'CategoryOption.g.dart';

@freezed
class CategoryOption with _$CategoryOption {
  const factory CategoryOption({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default([]) List<Option> categorieOption,
  }) = _CategoryOption;

  factory CategoryOption.fromJson(Map<String, Object?> json) =>
      _$CategoryOptionFromJson(json);

  static const String CategoryOptionFragment = """
  fragment CategoryOptionFragment on CategoryOptionGenericType {
    id
    createdAt
    updateAt
    deleted
    name
    categorieOption{
      ...OptionFragment
    }
  }
  """;

  static Future<List<CategoryOption>> all(
      Map<String, dynamic> variables) async {
    dynamic datas =
        await ApiService.request(CategoryOptionSchema.ALL, variables);
    List<CategoryOption> items = [];
    for (var jsonTask in datas["searchCategoryOption"]["results"]) {
      items.add(CategoryOption.fromJson(jsonTask));
    }
    return items;
  }
}
