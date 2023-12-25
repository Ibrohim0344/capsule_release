// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      token: json['token'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String? ?? "",
      doctorsPreiwew: json['doctorsPreiwew'] as int? ?? 0,
      age: json['age'] as int? ?? 0,
      information: json['information'] as String? ?? "",
      gostId: json['gostId'] as String? ?? "",
      ratingStar: (json['ratingStar'] as num?)?.toDouble() ?? 0,
      price: json['price'] as String? ?? "0",
      workExp: json['workExp'] as int? ?? 0,
      doctorStatus:
          $enumDecodeNullable(_$StatusEnumMap, json['doctorStatus']) ??
              Status.active,
    )..freeTimes = (json['freeTimes'] as List<dynamic>)
        .map((e) => DateTime.parse(e as String))
        .toList();

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'token': instance.token,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'age': instance.age,
      'information': instance.information,
      'freeTimes': instance.freeTimes.map((e) => e.toIso8601String()).toList(),
      'gostId': instance.gostId,
      'doctorsPreiwew': instance.doctorsPreiwew,
      'ratingStar': instance.ratingStar,
      'workExp': instance.workExp,
      'price': instance.price,
      'doctorStatus': _$StatusEnumMap[instance.doctorStatus]!,
    };

const _$StatusEnumMap = {
  Status.active: 'active',
  Status.noActive: 'noActive',
};
