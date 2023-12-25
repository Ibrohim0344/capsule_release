// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      doctorModel:
          DoctorModel.fromJson(json['doctorModel'] as Map<String, dynamic>),
      time: DateTime.parse(json['time'] as String),
      price: json['price'] as String,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'price': instance.price,
      'time': instance.time.toIso8601String(),
      'doctorModel': instance.doctorModel,
    };
