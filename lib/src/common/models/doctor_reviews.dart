import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'doctor_reviews.g.dart';

@JsonSerializable()
class DoctorReviews {
  final UserModel userModel;
  final String commentary;
  final DateTime messageTime;
  final int commentLikes;
  final int rating;

  DoctorReviews({
    required this.userModel,
    required this.commentary,
    required this.messageTime,
    required this.commentLikes,
    required this.rating,
  });

  factory DoctorReviews.fromJson(Map<String, Object?> json) =>
      _$DoctorReviewsFromJson(json);

  Map<String, Object?> toJson() => _$DoctorReviewsToJson(this);

  DoctorReviews copyWith(
    UserModel? userModel,
    String? commentary,
    DateTime? messageTime,
    int? commentLikes,
    int? rating,
  ) =>
      DoctorReviews(
        userModel: userModel ?? this.userModel,
        commentary: commentary ?? this.commentary,
        messageTime: messageTime ?? this.messageTime,
        commentLikes: commentLikes ?? this.commentLikes,
        rating: rating ?? this.rating,
      );

  @override
  String toString() {
    return 'DoctorReviews{userModel: $userModel, commentary: $commentary, messageTime: $messageTime, commentLikes: $commentLikes, rating: $rating}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorReviews &&
          runtimeType == other.runtimeType &&
          userModel == other.userModel &&
          commentary == other.commentary &&
          messageTime == other.messageTime &&
          commentLikes == other.commentLikes &&
          rating == other.rating;

  @override
  int get hashCode =>
      userModel.hashCode ^
      commentary.hashCode ^
      messageTime.hashCode ^
      commentLikes.hashCode ^
      rating.hashCode;
}
