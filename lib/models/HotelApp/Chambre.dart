// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Chambre.freezed.dart';
part 'Chambre.g.dart';

@freezed
class Chambre with _$Chambre {
  const factory Chambre({
    @Default("") String id,
    @Default("") String createdAt,
    @Default("") String updateAt,
    @Default(false) bool deleted,
    @Default("") String identifiant,
    @Default("") String name,
    @Default("") String code,
    @Default("") String logo,
    Pays? pays,
    TypeChambre? type,
  }) = _Chambre;

  factory Chambre.fromJson(Map<String, Object?> json) =>
      _$ChambreFromJson(json);

  static const String ChambreFragment = """
  fragment ChambreFragment on ChambreGenericType {
    id
    createdAt
    updateAt
    deleted
    identifiant
    name
    code
    logo
    pays{
      ...PaysFragment
    }
    type{
      ...TypeChambreFragment
    }
  }
  """;

  static Future<List<Chambre>> all(Map<String, dynamic> variables) async {
    dynamic datas = await ApiService.request(ChambreSchema.ALL, variables);
    List<Chambre> items = [];
    for (var jsonTask in datas["searchChambre"]["results"]) {
      items.add(Chambre.fromJson(jsonTask));
    }
    return items;
  }
}
