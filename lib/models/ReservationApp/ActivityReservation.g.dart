// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityReservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityReservationImpl _$$ActivityReservationImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityReservationImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
      isPublic: json['isPublic'] as bool? ?? true,
      activity: json['activity'] == null
          ? const Activity()
          : Activity.fromJson(json['activity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActivityReservationImplToJson(
        _$ActivityReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'price': instance.price,
      'isPublic': instance.isPublic,
      'activity': instance.activity,
    };
