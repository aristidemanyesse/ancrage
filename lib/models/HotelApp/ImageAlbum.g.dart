// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageAlbum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageAlbumImpl _$$ImageAlbumImplFromJson(Map<String, dynamic> json) =>
    _$ImageAlbumImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      image: json['image'] as String? ?? "",
    );

Map<String, dynamic> _$$ImageAlbumImplToJson(_$ImageAlbumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'image': instance.image,
    };
