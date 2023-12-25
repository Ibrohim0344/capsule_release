// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      image: json['image'] as String? ?? "",
      token: json['token'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      cardModel: json['cardModel'] == null
          ? null
          : CardModel.fromJson(json['cardModel'] as Map<String, dynamic>),
      booking: (json['booking'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoritesDoctors: (json['favoritesDoctors'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastName: json['lastName'] as String? ?? "",
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'image': instance.image,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'favoritesDoctors': instance.favoritesDoctors,
      'cardModel': instance.cardModel,
      'booking': instance.booking,
    };
