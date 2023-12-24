import 'dart:io';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'card_model.dart';

part 'doctor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final String id;
  final String fullName;
  final String gender;
  final String token;
  final String email;
  final String phoneNumber;
  final String password;
  final int age;
  final Map<String, File> sertificate;
  final String information;
  List<DateTime> freeTimes;
  final String gostId;
  final CardModel cardModel;
  List<UserModel> doctorsPreiwew;
  final double ratingStar;
  final int workExp;
  final Map<String, DateTime> workhistory;
  final String price;
  final Status doctorStatus;

  DoctorModel({
    required this.id,
    required this.fullName,
    required this.token,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.gender = "",
    this.age = 0,
    this.information = "",
    this.gostId="",
    this.ratingStar=0,
    this.price="0",
    this.workExp=0,
    this.doctorStatus=Status.active,
  })  : sertificate = {},
        freeTimes = [],cardModel=CardModel(
          number:
          "1611${Random().nextInt(9000) + 1000}${Random().nextInt(9000) + 1000}${Random().nextInt(9000) + 1000}",
          quantity: "0"),doctorsPreiwew=[],workhistory={};

  DoctorModel copyWith({
    String? id,
    String? fullName,
    String? gender,
    String? token,
    String? email,
    String? phoneNumber,
    String? password,
    int? age,
    Set<File>? sertificate,
    String? information,
    List<DateTime>? freeTimes,
  }) =>
      DoctorModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        token: token ?? this.token,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        gender: gender ??  this.gender,
        age: age ?? this.age,
        information: information ??  this.information,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorModel &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName &&
          gender == other.gender &&
          token == other.token &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          password == other.password &&
          age == other.age &&
          sertificate == other.sertificate &&
          information == other.information &&
          freeTimes == other.freeTimes;

  factory DoctorModel.fromJson(Map<String, Object?> json) =>
      _$DoctorModelFromJson(json);

  Map<String, Object?> toJson() => _$DoctorModelToJson(this);

  @override
  int get hashCode =>
      fullName.hashCode ^
      gender.hashCode ^
      token.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      password.hashCode ^
      age.hashCode ^
      sertificate.hashCode ^
      information.hashCode ^
      freeTimes.hashCode;

  @override
  String toString() {
    return 'DoctorModel{fullName: $fullName, gender: $gender, token: $token, email: $email, phoneNumber: $phoneNumber, password: $password, age: $age, sertificate: $sertificate, information: $information, freeTimes: $freeTimes}';
  }
}


enum Status{
  active,
  noActive,
}