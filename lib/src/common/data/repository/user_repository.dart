import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import '../../models/user_model.dart';
import '../../services/database_service.dart';


abstract interface class IUserRepository {
  Stream<UserModel> getUllUsers();

  DatabaseReference queryPost();


  Future<UserModel?> readUser(String uid);

  Future<void> updateUser(UserModel user,String uid);
}

class UserRepository implements IUserRepository {
  UserRepository({required this.messagePath}) : _service = DataBaseService();

  final DataBaseService _service;
  String messagePath;

  @override
  Stream<UserModel> getUllUsers() => _service.getAllUser(messagePath).transform(
    StreamTransformer<DatabaseEvent, UserModel>.fromHandlers(
      handleData: (data, sink) {
        for (final json in (data.snapshot.value as Map).values) {
          final user = UserModel.fromJson(Map<String, Object?>.from(json));
          sink.add(user);
        }
      },
    ),
  );

  @override
  DatabaseReference queryPost() => _service.queryFromPath(messagePath);

  @override
  Future<UserModel?> readUser(String uid) async =>
      await _service.readUser(uid);

  @override
  Future<void> updateUser(
      UserModel user, String uid) =>
      _service.updateUser(user,uid);
}
