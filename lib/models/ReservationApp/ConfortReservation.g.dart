// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConfortReservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfortReservationImpl _$$ConfortReservationImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfortReservationImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      option: json['option'] == null
          ? const Option()
          : Option.fromJson(json['option'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConfortReservationImplToJson(
        _$ConfortReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'option': instance.option,
    };
