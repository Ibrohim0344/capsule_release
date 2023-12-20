import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/common/services/notification_service.dart';
import 'src/common/widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseDatabase.instance.setPersistenceEnabled(true);

  NotificationService()
    ..requestPermisson()
    ..generateToken()
    ..notificationSettings();

  runApp(const App());
}
