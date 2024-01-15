// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      fullname: json['fullname'] as String? ?? "",
      contact: json['contact'] as String? ?? "",
      sujet: json['sujet'] as String? ?? "",
      message: json['message'] as String? ?? "",
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'fullname': instance.fullname,
      'contact': instance.contact,
      'sujet': instance.sujet,
      'message': instance.message,
    };
