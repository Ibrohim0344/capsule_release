// import 'dart:convert';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
//
// import '../models/user_model.dart';
// import 'database_service.dart';
// import 'storage/storage.dart';
//
// sealed class AuthService {
//   static final auth = FirebaseAuth.instance;
//
//   static Future<bool> registration(String email, String name, String phoneNumber) async {
//     try {
//       final credential = await auth.createUserWithEmailAndPassword(email: email, password: phoneNumber);
//       if(credential.user != null) {
//         await credential.user!.updateDisplayName(name);
//         await DataBaseService.storeUser(email, name, phoneNumber, phoneNumber);
//       }
//       return credential.user != null;
//     } catch (e) {
//       debugPrint("ERROR: $e");
//       return false;
//     }
//   }
//
//   static Future<bool> login(String email, String password) async {
//     try {
//       final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
//       UserModel currentUser = await DataBaseService.readUser(password) ??
//           UserModel(
//             id: "",
//             token: "",
//             phoneNumber: "",
//           );
//       await $secureStorage.write(key: StorageKeys.user.key, value: jsonEncode(currentUser));
//       return credential.user != null;
//     } catch(e) {
//       debugPrint("ERROR: $e");
//       return false;
//     }
//   }
//
//   static Future<bool> logOut() async {
//     try {
//       await auth.signOut();
//       return true;
//     } catch (e) {
//       debugPrint("ERROR: $e");
//       return false;
//     }
//   }
//
//   static Future<bool> deleteAccount() async {
//
//     /// Har qanday appda delete account qilinganda avvalo qayta sign in qilishi talab qilinadi.
//     try {
//       if(auth.currentUser != null) {
//         await auth.currentUser!.delete();
//         return true;
//       }
//       return false;
//     } catch (e) {
//       debugPrint("ERROR: $e");
//       return false;
//     }
//   }
//
//   static User? get user => auth.currentUser;
// }