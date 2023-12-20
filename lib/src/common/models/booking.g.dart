// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, Object?> json) => Booking(
      doctorModel:
          DoctorModel.fromJson(json['doctorModel'] as Map<String, Object?>),
      time: DateTime.parse(json['time'] as String),
      price: json['price'] as String,
    );

Map<String, Object?> _$BookingToJson(Booking instance) => <String, Object?>{
      'price': instance.price,
      'time': instance.time.toIso8601String(),
      'doctorModel': instance.doctorModel,
    };
