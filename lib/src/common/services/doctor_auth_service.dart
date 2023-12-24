import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/doctor_model.dart';
import 'doctor_service.dart';

sealed class DoctorAuthService {
  static final auth = FirebaseAuth.instance;

  static Future<bool> registration(
    String name,
    String phoneNumber,
    String password,
    String token,
  ) async {
    try {
      final service = DoctorService();
      final credential = await auth.createUserWithEmailAndPassword(
          email: "email$phoneNumber@gmail.com", password: phoneNumber);
      if (credential.user != null) {
        await credential.user!.updateDisplayName(name);
        await service.storeUser(
            name, phoneNumber, phoneNumber, password, token);
      }
      return credential.user != null;
    } catch (e) {
      debugPrint("ERROR: $e");
      return false;
    }
  }

  static Future<bool> login(String password) async {
    try {
      final service = DoctorService();
      final credential = await auth.signInWithEmailAndPassword(
          email: "email$password@gmail.com", password: password);
      DoctorModel currentUser = await service.readUser(password) ??
          DoctorModel(
            id: "",
            fullName: "",
            token: "",
            email: "",
            phoneNumber: "",
            password: "",
          );
      return credential.user != null;
    } catch (e) {
      debugPrint("ERROR: $e");
      return false;
    }
  }

  static Future<bool> logOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      debugPrint("ERROR: $e");
      return false;
    }
  }

  static Future<bool> deleteAccount() async {
    /// Har qanday appda delete account qilinganda avvalo qayta sign in qilishi talab qilinadi.
    try {
      if (auth.currentUser != null) {
        await auth.currentUser!.delete();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint("ERROR: $e");
      return false;
    }
  }

  static User? get user => auth.currentUser;
}
