// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformation _$UserInformationFromJson(Map<String, Object?> json) =>
    UserInformation(
      height: (json['height'] as num?)?.toDouble() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
      disease: json['disease'] as String? ?? "",
      heartbeat: json['heartbeat'] as int? ?? 0,
      bloodPressure: _$recordConvert(
            json['bloodPressure'],
            ($jsonValue) => (
              $jsonValue[r'$1'] as int,
              $jsonValue[r'$2'] as int,
            ),
          ) ??
          (120, 80),
    );

Map<String, Object?> _$UserInformationToJson(UserInformation instance) =>
    <String, Object?>{
      'height': instance.height,
      'weight': instance.weight,
      'disease': instance.disease,
      'heartbeat': instance.heartbeat,
      'bloodPressure': {
        r'$1': instance.bloodPressure.$1,
        r'$2': instance.bloodPressure.$2,
      },
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, Object?>);
