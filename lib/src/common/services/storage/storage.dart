import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../controller/user_controller.dart';

late final FlutterSecureStorage $secureStorage;
late final CurrentUser $currentUser;



enum StorageKeys {
  user("user");

  const StorageKeys(this.key);

  final String key;
}