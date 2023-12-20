import 'doctor_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  final String price;
  final DateTime time;
  final DoctorModel doctorModel;

  Booking({
    required this.doctorModel,
    required this.time,
    required this.price,
  });


  factory Booking.fromJson(Map<String, Object?> json) => _$BookingFromJson(json);

  Map<String, Object?> toJson() => _$BookingToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Booking &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          time == other.time &&
          doctorModel == other.doctorModel;

  @override
  int get hashCode => price.hashCode ^ time.hashCode ^ doctorModel.hashCode;

  @override
  String toString() {
    return 'Booking{price: $price, time: $time, doctorModel: $doctorModel}';
  }
}
