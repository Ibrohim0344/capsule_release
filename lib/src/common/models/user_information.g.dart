// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
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

Map<String, dynamic> _$UserInformationToJson(UserInformation instance) =>
    <String, dynamic>{
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
    convert(value as Map<String, dynamic>);
