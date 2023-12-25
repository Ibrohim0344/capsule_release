import 'package:json_annotation/json_annotation.dart';

part 'doctor_promocode.g.dart';

@JsonSerializable()
class DoctorPromoCode {
  final String promoCode;
  final int discountProsent;
  final DateTime endTime;

  DoctorPromoCode({
    this.promoCode = "",
    this.discountProsent = 0,
    final DateTime? dateTime,
  }) : endTime = dateTime ?? DateTime.now();


  factory DoctorPromoCode.fromJson(Map<String, Object?> json) =>
      _$DoctorPromoCodeFromJson(json);

  Map<String, Object?> toJson() => _$DoctorPromoCodeToJson(this);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorPromoCode &&
          runtimeType == other.runtimeType &&
          promoCode == other.promoCode &&
          discountProsent == other.discountProsent &&
          endTime == other.endTime;

  @override
  int get hashCode =>
      promoCode.hashCode ^ discountProsent.hashCode ^ endTime.hashCode;

  @override
  String toString() {
    return 'DoctorPromoCode{promoCode: $promoCode, discountProsent: $discountProsent, endTime: $endTime}';
  }
}
