// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Option.freezed.dart';
part 'Option.g.dart';

@freezed
class Option with _$Option {
  const factory Option({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String name,
    @Default(false) bool isChecked,
  }) = _Option;

  factory Option.fromJson(Map<String, Object?> json) => _$OptionFromJson(json);

  static const String OptionFragment = """
  fragment OptionFragment on OptionGenericType {
    id
    createdAt
    updateAt
    deleted
    name
  }
  """;
}
