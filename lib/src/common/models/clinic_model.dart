import 'doctor_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'clinic_model.g.dart';

@JsonSerializable()
class ClinicsModel {
  final String token;
  final String profilePhotos;
  final String companyName;
  final String location;
  final DateTime openingTime;
  final List<WhichDays> whichDays;
  final List<DoctorModel> doctorsModel;

  ClinicsModel({
    required this.token,
    required this.profilePhotos,
    required this.companyName,
    required this.location,
    required this.openingTime,
  })  : whichDays = [
          WhichDays.Monday,
          WhichDays.Tuesday,
          WhichDays.Wednesday,
          WhichDays.Thursday,
          WhichDays.Friday,
          WhichDays.Saturday,
          WhichDays.Sunday,
        ],
        doctorsModel = [];


  factory ClinicsModel.fromJson(Map<String, Object?> json) =>
      _$ClinicsModelFromJson(json);

  Map<String, Object?> toJson() => _$ClinicsModelToJson(this);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClinicsModel &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          profilePhotos == other.profilePhotos &&
          companyName == other.companyName &&
          location == other.location &&
          openingTime == other.openingTime &&
          whichDays == other.whichDays &&
          doctorsModel == other.doctorsModel;

  @override
  int get hashCode =>
      token.hashCode ^
      profilePhotos.hashCode ^
      companyName.hashCode ^
      location.hashCode ^
      openingTime.hashCode ^
      whichDays.hashCode ^
      doctorsModel.hashCode;

  @override
  String toString() {
    return 'ClinicsModel{token: $token, profilePhotos: $profilePhotos, companyName: $companyName, location: $location, openingTime: $openingTime, whichDays: $whichDays, doctorsModel: $doctorsModel}';
  }
}

enum WhichDays {
  Monday("Monday", false),
  Tuesday("Tuesday", false),
  Wednesday("Wednesday", false),
  Thursday("Thursday", false),
  Friday("Friday", false),
  Saturday("Saturday", false),
  Sunday("Sunday", false);

  const WhichDays(
    this.name,
    this.status,
  );

  final String name;
  final bool status;
}
