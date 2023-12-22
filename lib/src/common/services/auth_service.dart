import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/user_model.dart';
import 'database_service.dart';

sealed class AuthService {
  static final auth = FirebaseAuth.instance;

  static Future<bool> registration(String name, String phoneNumber) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(email: "yunusov@gmail.com", password: phoneNumber);
      if(credential.user != null) {
        final service=DataBaseService();
        await credential.user!.updateDisplayName(name);
        await service.storeUser(name, phoneNumber, phoneNumber);
      }
      return credential.user != null;
    } catch (e) {
      debugPrint("ERROR: $e");
      return false;
    }
  }

  static Future<bool> login(String password) async {
    try {
      final service=DataBaseService();
      final credential = await auth.signInWithEmailAndPassword(email: "yunusov@gmail.com", password: password);
      UserModel currentUser = await service.readUser(password) ??
          UserModel(
            id: "",
            token: "",
            phoneNumber: "",
          );
      return credential.user != null;
    } catch(e) {
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
      if(auth.currentUser != null) {
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