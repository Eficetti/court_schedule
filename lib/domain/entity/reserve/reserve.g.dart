// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReserveImpl _$$ReserveImplFromJson(Map<String, dynamic> json) =>
    _$ReserveImpl(
      date: DateTime.parse(json['date'] as String),
      rainChance: (json['rainChance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      userReserve: json['userReserve'] as String,
      reservedCourt:
          Court.fromJson(json['reservedCourt'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ReserveImplToJson(_$ReserveImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'rainChance': instance.rainChance,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'userReserve': instance.userReserve,
      'reservedCourt': instance.reservedCourt,
      'id': instance.id,
    };
