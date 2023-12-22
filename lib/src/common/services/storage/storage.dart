import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../controller/user_controller.dart';

final FlutterSecureStorage $secureStorage= FlutterSecureStorage();
final CurrentUser $currentUser=CurrentUser();


enum StorageKeys {
  user("user");

  const StorageKeys(this.key);

  final String key;
}