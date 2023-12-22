import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../data/repository/user_repository.dart';
import '../models/user_model.dart';
import '../services/storage/storage.dart';

class CurrentUser extends ChangeNotifier {
  UserModel? currentUser;

  void getUser() async {
    String path = await $secureStorage.read(key: StorageKeys.user.key) ?? "";
    currentUser = UserModel.fromJson(jsonDecode(path));
    notifyListeners();
  }

  void updateUser(UserModel userModel, String uid) async {
    IUserRepository userRepository = UserRepository(messagePath: '');
    await userRepository.updateUser(userModel, uid);
    $secureStorage.write(
        key: StorageKeys.user.key, value: jsonEncode(currentUser));
    currentUser = userModel;
    print("--------------------------------");
    print(currentUser);
    notifyListeners();
  }

  void logOutUser() {
    $secureStorage.delete(key: StorageKeys.user.key);
  }
}
