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
      tag: json['tag'] as String? ?? "",
      publicPrice: json['publicPrice'] as int? ?? 0,
      privatePrice: json['privatePrice'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      prerequis: json['prerequis'] as String? ?? "",
      image: json['image'] as String? ?? "",
      image1: json['image1'] as String? ?? "",
      image2: json['image2'] as String? ?? "",
      image3: json['image3'] as String? ?? "",
      image4: json['image4'] as String? ?? "",
      image5: json['image5'] as String? ?? "",
      background: json['background'] as String? ?? "",
      ittineraire: json['ittineraire'] as String? ?? "",
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'name': instance.name,
      'tag': instance.tag,
      'publicPrice': instance.publicPrice,
      'privatePrice': instance.privatePrice,
      'description': instance.description,
      'prerequis': instance.prerequis,
      'image': instance.image,
      'image1': instance.image1,
      'image2': instance.image2,
      'image3': instance.image3,
      'image4': instance.image4,
      'image5': instance.image5,
      'background': instance.background,
      'ittineraire': instance.ittineraire,
    };
