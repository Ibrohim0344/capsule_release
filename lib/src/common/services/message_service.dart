import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

import '../constants/firebase_path.dart';
import '../model/message_model.dart';
import 'database_service.dart';


abstract interface class IMessageRepository {
  final String chatPath;

  const IMessageRepository(this.chatPath);

  DatabaseReference queryMessage();

  Stream<MessageModel> getAllData();

  Future<void> createMessage(MessageModel message);

  Future<void> deleteMessage(String id);

  Future<void> updateMessage(MessageModel message);
}

class MessageRepository extends IMessageRepository {
  MessageRepository(super.chatPath) : _service =  DataBaseService();
  final DataBaseService _service;

  @override
  Stream<MessageModel> getAllData() =>
      _service.getAllUser(ApiConsts.messagePath(chatPath)).transform(
        StreamTransformer<DatabaseEvent, MessageModel>.fromHandlers(
            handleData: (data, sink) {
              for (final json in (data.snapshot.value as Map).values) {
                final message =
                MessageModel.fromJson(Map<String, Object?>.from(json));
                sink.add(message);
              }
            }),
      );


  Future<void> createMessage(MessageModel message) =>
      _service.create(ApiConsts.messagePath(chatPath), message.toJson());

  @override
  DatabaseReference queryMessage() =>
      _service.queryFromPath(ApiConsts.messagePath(chatPath));

  @override
  Future<void> deleteMessage(String id) =>
      _service.delete(ApiConsts.messagePath(chatPath), id);

  @override
  Future<void> updateMessage(MessageModel message) => _service.update(
    dataPath: ApiConsts.messagePath(chatPath),
    id: message.id!,
    json: message.toJson(),
  );
}
