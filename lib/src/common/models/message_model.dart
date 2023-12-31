import 'package:meta/meta.dart';

class Message {
  final String uid;
  final String? body;
  final String id;
  final DateTime createdAt;
  final String edited;
  final String? url;

  Message({
    required this.uid,
    this.body,
    this.id = "",
    this.edited = "0",
    final DateTime? createdAt,
    this.url,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Message.fromJson(Map<String, Object?> json) => Message(
    uid: json["uid"] as String,
    body: json["body"] as String?,
    id: json["id"] as String,
    edited: json["edited"] as String,
    url: json["url"] as String?,
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"] as String)
        : null,
  );

  Map<String, Object?> toJson() => {
    "uid": uid,
    "body": body,
    "id": id,
    "edited": edited,
    "created_at": createdAt.toIso8601String(),
    "url": url,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Message &&
              runtimeType == other.runtimeType &&
              uid == other.uid &&
              body == other.body &&
              id == other.id &&
              createdAt == other.createdAt;

  @override
  int get hashCode =>
      uid.hashCode ^ body.hashCode ^ id.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'Message{uid: $uid, body: $body, id: $id, createdAt: $createdAt}';
  }

  @useResult
  Message copyWith({
    String? uid,
    String? body,
    String? id,
    String? edited,
    String? url,
  }) =>
      Message(
        uid: uid ?? this.uid,
        body: body ?? this.body,
        id: id ?? this.id,
        edited: edited ?? this.edited,
        url: url ?? this.url,
      );
}