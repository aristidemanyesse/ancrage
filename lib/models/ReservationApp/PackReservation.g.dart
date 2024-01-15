// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PackReservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackReservationImpl _$$PackReservationImplFromJson(
        Map<String, dynamic> json) =>
    _$PackReservationImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
      pack: json['pack'] == null
          ? const Pack()
          : Pack.fromJson(json['pack'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PackReservationImplToJson(
        _$PackReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'price': instance.price,
      'pack': instance.pack,
    };
