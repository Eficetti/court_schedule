// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourtImpl _$$CourtImplFromJson(Map<String, dynamic> json) => _$CourtImpl(
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$CourtImplToJson(_$CourtImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };
