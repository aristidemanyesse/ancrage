// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackImpl _$$PackImplFromJson(Map<String, dynamic> json) => _$PackImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      name: json['name'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      nbreLit: json['nbreLit'] as int? ?? 0,
      superficie: json['superficie'] as int? ?? 0,
      modeleLit: json['modeleLit'] as String? ?? "",
      inclus: json['inclus'] as String? ?? "",
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$$PackImplToJson(_$PackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'name': instance.name,
      'price': instance.price,
      'nbreLit': instance.nbreLit,
      'superficie': instance.superficie,
      'modeleLit': instance.modeleLit,
      'inclus': instance.inclus,
      'image': instance.image,
    };
