// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, Object?> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      token: json['token'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      cardModel: json['cardModel'] == null
          ? null
          : CardModel.fromJson(json['cardModel'] as Map<String, Object?>),
      booking: (json['booking'] as List<Object?>?)
          ?.map((e) => Booking.fromJson(e as Map<String, Object?>))
          .toList(),
      lastName: json['lastName'] as String? ?? "",
      image: json['image'] as String ?? "",
    );

Map<String, Object?> _$UserModelToJson(UserModel instance) => <String, Object?>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'cardModel': instance.cardModel.toJson(),
      'booking': instance.booking,
      'image':instance.image,
    };
