import 'dart:math';

import 'booking.dart';
import 'card_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
   String name;
   String lastName;
  late final DateTime dateOfBirth;
  final String image;
  final String phoneNumber;
  final String email;
  final String password;
  final String token;

  // final UserInformation userInformation;
  final CardModel cardModel;
  final List<Booking> booking;

  UserModel({
    required this.id,
    this.name = "",
    this.email = "",
    this.password = "",
    this.image="",
    required this.token,
    required this.phoneNumber,
    final DateTime? dateOfBirth,
    final CardModel? cardModel,
    final List<Booking>? booking,
    this.lastName = "",
  })  : dateOfBirth = dateOfBirth ?? DateTime.now(),
        // userInformation = UserInformation(),
        cardModel = cardModel ??
            CardModel(
                number:
                    "0510 ${Random().nextInt(9000) + 1000} ${Random().nextInt(9000) + 1000} ${Random().nextInt(9000) + 1000}",
                quantity: "0"),
        booking = booking ?? [];

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  Map<String, Object?> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? name,
    String? lastName,
    DateTime? dateOfBirth,
    String? phoneNumber,
    String? email,
    String? password,
    String? token,
    String? image,
    // UserInformation? userInformation,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        password: password ?? this.password,
        token: token ?? this.token,
        image: image ?? this.image,
      );

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      other is UserModel &&
      runtimeType == other.runtimeType &&
      id == other.id &&
      name == other.name &&
      email == other.email &&
      password == other.password;

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, listName: $lastName, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, email: $email, password: $password, token: $token}';
  }
}
