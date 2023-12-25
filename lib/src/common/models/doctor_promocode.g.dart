// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_promocode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorPromoCode _$DoctorPromoCodeFromJson(Map<String, dynamic> json) =>
    DoctorPromoCode(
      promoCode: json['promoCode'] as String? ?? "",
      discountProsent: json['discountProsent'] as int? ?? 0,
    );

Map<String, dynamic> _$DoctorPromoCodeToJson(DoctorPromoCode instance) =>
    <String, dynamic>{
      'promoCode': instance.promoCode,
      'discountProsent': instance.discountProsent,
    };
