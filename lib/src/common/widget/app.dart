import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/splash_page/splash_page.dart';
import '../controller/chip_provider.dart';
import '../controller/user_controller.dart';
import '../services/localization/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentUser()),
        ChangeNotifierProvider(create: (context) => ChipProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          title: "Capsule",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('ru'),
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: "Urbanist",
          ),
          home: const SplashPage(),
        );
      },
    );
  }
}
