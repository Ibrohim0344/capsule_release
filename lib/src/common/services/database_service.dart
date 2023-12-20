import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/user_model.dart';
import 'notification_service.dart';
import 'storage/storage.dart';

class DataBaseService {
  static final db = FirebaseDatabase.instance;

  Stream<DatabaseEvent> getAllUser(String messagePath) =>
      db.ref(Folder.user).onValue.asBroadcastStream();

  DatabaseReference queryFromPath(String messagePath) => db.ref(Folder.user);

  Future<void> create(
      String dataPath,
      Map<String, Object?> json,
      ) async {
    final id = db.ref(dataPath).push().key;
    json['id'] = id;

    await db.ref(dataPath).child(id!).set(json);
  }


  Future<void> update({
    required String dataPath,
    required String id,
    required Map<String, Object?> json,
  }) =>
      db.ref(dataPath).child(id).update(json);


  Future<void> delete(String dataPath, String id) =>
      db.ref(dataPath).child(id).remove();


  Future<void> updateUser(
      UserModel userModel,
      String uid,
      ) {
    return db.ref(Folder.user).child(uid).update(userModel.toJson());
  }

  static Future<bool> storeUser(
      String name,
      String phoneNumber,
      String uid,
      ) async {
    try {
      final folder = db.ref(Folder.user).child(uid);
      NotificationService notificationService = NotificationService();
      await notificationService.generateToken();

      final user = UserModel(
        email: "",
        name: name,
        id: uid,
        token: notificationService.fcmTocen ?? "",
        phoneNumber: phoneNumber,
      );
      await $secureStorage.write(key: StorageKeys.user.key, value: jsonEncode(user));
      await folder.set(user.toJson());
      return true;
    } catch (e) {
      debugPrint("DB ERROR: $e");
      return false;
    }
  }

  static Future<UserModel?> readUser(String uid) async {
    try {
      final data = await db.ref(Folder.user).child(uid).get();
      final member = UserModel.fromJson(
          jsonDecode(jsonEncode(data.value)) as Map<String, dynamic>);
      return member;
    } catch (e) {
      debugPrint("DB ERROR: $e");
      return null;
    }
  }
}

sealed class Folder {
  static const user = "User";
}