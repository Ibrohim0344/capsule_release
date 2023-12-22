
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/auth/auth/send_code.dart';

class SmsService {
  final auth = FirebaseAuth.instance;

  void phoneAuthUser(String phone, context, String name) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phone.replaceAll(" ", ""),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) async {
        print("--------------------------------------------------------------");
        print(phoneAuthCredential.smsCode);
        print("--------------------------------------------------------------");
        final credential = await auth.signInWithCredential(phoneAuthCredential);
        if (credential.user != null && name != "") {
          await credential.user!.updateDisplayName(name);
          // await DataBaseService.storeUser(name, phone, phone);
        } else if (credential.user != null && name == "") {
          // final user = await DataBaseService.readUser(phone);
          // await $secureStorage.write(
          //     key: StorageKeys.user.key, value: jsonEncode(user));
        }
      },
      verificationFailed: (error) {
        print("**************************************************************");
        print(error);
        print("**************************************************************");
      },
      codeSent: (String verificationId, forceResendingToken) {
        print("==============================================================");
        print(forceResendingToken);
        print("==============================================================");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendCode(verificationId: verificationId),
            ));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print(verificationId);
      },
    );
  }

  void phoneAuthDoctor(
      String phone,
      context,
      String name,
      String password,
      String token,
      ) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phone.replaceAll(" ", ""),
      timeout: const Duration(seconds: 60),
      verificationCompleted: (phoneAuthCredential) async {
        print("--------------------------------------------------------------");
        print(phoneAuthCredential.smsCode);
        print("--------------------------------------------------------------");
        final credential = await auth.signInWithCredential(phoneAuthCredential);
        if (credential.user != null && name != "doctor") {
          await credential.user!.updateDisplayName(name);
          // await DoctorService.storeUser(name, phone, phone, password, token);
        } else if (credential.user != null && name == "doctor") {
          // final doctor = await DoctorService.readUser(phone);
          // await $secureStorage.write(
          //     key: StorageKeys.user.key, value: jsonEncode(doctor));
        }
      },
      verificationFailed: (error) {
        print("--------------------------------------------------------------");
        print(error);
        print("--------------------------------------------------------------");
      },
      codeSent: (String verificationId, forceResendingToken) {
        print("--------------------------------------------------------------");
        print(forceResendingToken);
        print("--------------------------------------------------------------");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SendCode(verificationId: verificationId),
            ));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print(verificationId);
      },
    );
  }
}