// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      name: json['name'] as String? ?? "",
      publicPrice: json['publicPrice'] as int? ?? 0,
      privatePrice: json['privatePrice'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      prerequis: json['prerequis'] as String? ?? "",
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'name': instance.name,
      'publicPrice': instance.publicPrice,
      'privatePrice': instance.privatePrice,
      'description': instance.description,
      'prerequis': instance.prerequis,
      'image': instance.image,
    };
