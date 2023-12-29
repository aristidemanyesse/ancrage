// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryOption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryOptionImpl _$$CategoryOptionImplFromJson(Map<String, dynamic> json) =>
    _$CategoryOptionImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      name: json['name'] as String? ?? "",
      categorieOption: (json['categorieOption'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryOptionImplToJson(
        _$CategoryOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'name': instance.name,
      'categorieOption': instance.categorieOption,
    };
