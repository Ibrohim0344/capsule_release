import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  String number;
  String quantity;

  CardModel({
    required this.number,
    required this.quantity,
  });


  factory CardModel.fromJson(Map<String, Object?> json) => _$CardModelFromJson(json);

  Map<String, Object?> toJson() => _$CardModelToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          quantity == other.quantity;

  @override
  int get hashCode => number.hashCode ^ quantity.hashCode;

  @override
  String toString() {
    return 'CardModel{number: $number, quantity: $quantity}';
  }
}
