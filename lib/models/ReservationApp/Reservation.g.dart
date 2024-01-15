// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      id: json['id'] as String? ?? "",
      createdAt: json['createdAt'] as String? ?? "",
      updateAt: json['updateAt'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
      debut: json['debut'] as String? ?? "",
      fin: json['fin'] as String? ?? "",
      personne: json['personne'] as int? ?? 0,
      chambre: json['chambre'] as int? ?? 0,
      clientCivility: json['clientCivility'] as String? ?? "",
      clientName: json['clientName'] as String? ?? "",
      clientEmail: json['clientEmail'] as String? ?? "",
      clientContact: json['clientContact'] as String? ?? "",
      isAllergie: json['isAllergie'] as bool? ?? false,
      allergies: json['allergies'] as String? ?? "",
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'deleted': instance.deleted,
      'price': instance.price,
      'debut': instance.debut,
      'fin': instance.fin,
      'personne': instance.personne,
      'chambre': instance.chambre,
      'clientCivility': instance.clientCivility,
      'clientName': instance.clientName,
      'clientEmail': instance.clientEmail,
      'clientContact': instance.clientContact,
      'isAllergie': instance.isAllergie,
      'allergies': instance.allergies,
    };
