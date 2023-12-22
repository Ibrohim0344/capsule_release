import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/services/auth_service.dart';
import '../../common/services/storage/storage.dart';
import '../../common/utils/context_utils.dart';
import '../main/main_page.dart';
import 'splash_corusel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void getCurrentUser(){
    if(AuthService.user != null){
      $currentUser.getUser();
    }
  }

  @override
  void initState() {
    getCurrentUser();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthService.user != null
              ? const MainPage()
              : const SplashCorusel(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: Image(
                image: AssetImage(AppImages.fonDoctor),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Welcome to\nCapsule!👋",
                style: context.textTheme.displayMedium?.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}