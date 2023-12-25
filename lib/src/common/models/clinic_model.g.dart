// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicsModel _$ClinicsModelFromJson(Map<String, dynamic> json) => ClinicsModel(
      token: json['token'] as String,
      profilePhotos: json['profilePhotos'] as String,
      companyName: json['companyName'] as String,
      location: json['location'] as String,
      openingTime: DateTime.parse(json['openingTime'] as String),
    );

Map<String, dynamic> _$ClinicsModelToJson(ClinicsModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'profilePhotos': instance.profilePhotos,
      'companyName': instance.companyName,
      'location': instance.location,
      'openingTime': instance.openingTime.toIso8601String(),
    };
