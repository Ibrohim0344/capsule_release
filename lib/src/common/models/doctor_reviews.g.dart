// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorReviews _$DoctorReviewsFromJson(Map<String, dynamic> json) =>
    DoctorReviews(
      userModel: UserModel.fromJson(json['userModel'] as Map<String, dynamic>),
      commentary: json['commentary'] as String,
      messageTime: DateTime.parse(json['messageTime'] as String),
      commentLikes: json['commentLikes'] as int,
      rating: json['rating'] as int,
    );

Map<String, dynamic> _$DoctorReviewsToJson(DoctorReviews instance) =>
    <String, dynamic>{
      'userModel': instance.userModel,
      'commentary': instance.commentary,
      'messageTime': instance.messageTime.toIso8601String(),
      'commentLikes': instance.commentLikes,
      'rating': instance.rating,
    };
