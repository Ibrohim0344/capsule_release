// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorPrice _$DoctorPriceFromJson(Map<String, dynamic> json) => DoctorPrice(
      forFiveMinutesPrice: json['forFiveMinutesPrice'] as int? ?? 0,
      discountPrice: json['discountPrice'] as int? ?? 0,
      sellerPrice: json['sellerPrice'] as int? ?? 0,
      capsuleCommission: json['capsuleCommission'] as int? ?? 5,
    );

Map<String, dynamic> _$DoctorPriceToJson(DoctorPrice instance) =>
    <String, dynamic>{
      'forFiveMinutesPrice': instance.forFiveMinutesPrice,
      'discountPrice': instance.discountPrice,
      'sellerPrice': instance.sellerPrice,
      'capsuleCommission': instance.capsuleCommission,
    };
