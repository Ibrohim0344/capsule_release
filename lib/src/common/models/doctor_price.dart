import 'package:json_annotation/json_annotation.dart';

part 'doctor_price.g.dart';

@JsonSerializable()
class DoctorPrice {
  final int forFiveMinutesPrice;
  final int discountPrice;
  final int sellerPrice;
  final int capsuleCommission;

  DoctorPrice({
    this.forFiveMinutesPrice = 0,
    this.discountPrice = 0,
    this.sellerPrice = 0,
    this.capsuleCommission = 5,
  });


  factory DoctorPrice.fromJson(Map<String, Object?> json) =>
      _$DoctorPriceFromJson(json);

  Map<String, Object?> toJson() => _$DoctorPriceToJson(this);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorPrice &&
          runtimeType == other.runtimeType &&
          forFiveMinutesPrice == other.forFiveMinutesPrice &&
          discountPrice == other.discountPrice &&
          sellerPrice == other.sellerPrice &&
          capsuleCommission == other.capsuleCommission;

  @override
  int get hashCode =>
      forFiveMinutesPrice.hashCode ^
      discountPrice.hashCode ^
      sellerPrice.hashCode ^
      capsuleCommission.hashCode;

  @override
  String toString() {
    return 'DoctorPrice{forFiveMinutesPrice: $forFiveMinutesPrice, discountPrice: $discountPrice, sellerPrice: $sellerPrice, capsuleCommission: $capsuleCommission}';
  }
}
