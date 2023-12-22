import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

import '../models/doctor_model.dart';
import 'notification_service.dart';
import 'storage/storage.dart';

class DoctorService {
  static final db = FirebaseDatabase.instance;

  Stream<DatabaseEvent> getAllUser() =>
      db.ref(Folder.doctor).onValue.asBroadcastStream();

  DatabaseReference queryFromPath() => db.ref(Folder.doctor);

  Future<void> updateUser(
      DoctorModel doctorModel,
      String uid,
      ) {
    return db.ref(Folder.doctor).child(uid).update(doctorModel.toJson());
  }

  Future<bool> storeUser(
      String name,
      String phoneNumber,
      String uid,
      String password,
      String token,
      ) async {
    try {
      final folder = db.ref(Folder.doctor).child(uid);
      NotificationService notificationService = NotificationService();
      await notificationService.generateToken();

      final user = DoctorModel(
        email: "",
        fullName: name,
        id: uid,
        token: token,
        phoneNumber: phoneNumber,
        password: password,
      );
      await $secureStorage.write(
          key: StorageKeys.user.key, value: jsonEncode(user));
      await folder.set(user.toJson());
      return true;
    } catch (e) {
      debugPrint("DB ERROR: $e");
      return false;
    }
  }

  Future<DoctorModel?> readUser(String uid) async {
    try {
      final data = await db.ref(Folder.doctor).child(uid).get();
      final member = DoctorModel.fromJson(
          jsonDecode(jsonEncode(data.value)) as Map<String, Object>);
      await $secureStorage.write(
          key: StorageKeys.user.key, value: jsonEncode(member));
      return member;
    } catch (e) {
      debugPrint("DB ERROR: $e");
      return null;
    }
  }
}

sealed class Folder {
  static const doctor = "Doctor";
}