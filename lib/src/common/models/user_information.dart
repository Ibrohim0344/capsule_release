// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'user_information.g.dart';

@JsonSerializable()
class UserInformation {
  double height;
  double weight;
  String disease;
  int heartbeat;
  (int, int) bloodPressure;
  // double temperatura
  // String problemm

  UserInformation({
    this.height = 0,
    this.weight = 0,
    this.disease = "",
    this.heartbeat = 0,
    this.bloodPressure = (120, 80),
  });

  UserInformation copyWith(
    double? height,
    double? weight,
    String? disease,
    int? heartbeat,
    (int, int)? bloodPressure,
  ) {
    return UserInformation(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      disease: disease ?? this.disease,
      heartbeat: heartbeat ?? this.heartbeat,
      bloodPressure: bloodPressure ?? this.bloodPressure,
    );
  }

  factory UserInformation.fromJson(Map<String, Object?> json) => _$UserInformationFromJson(json);

  Map<String, Object?> toJson() => _$UserInformationToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformation &&
          runtimeType == other.runtimeType &&
          height == other.height &&
          weight == other.weight &&
          disease == other.disease &&
          heartbeat == other.heartbeat &&
          bloodPressure == other.bloodPressure;

  @override
  int get hashCode =>
      height.hashCode ^
      weight.hashCode ^
      disease.hashCode ^
      heartbeat.hashCode ^
      bloodPressure.hashCode;

  @override
  String toString() {
    return 'UserInformation{height: $height, weight: $weight, disease: $disease, heartbeat: $heartbeat, bloodPressure: $bloodPressure}';
  }
}
