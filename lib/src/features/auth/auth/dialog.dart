import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CongratulationsDialog extends StatelessWidget {
  const CongratulationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: const Text(
        "Congratulations!",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xFF246BFD),
        ),
      ),
      icon: SvgPicture.asset("assets/images/person/dialog.svg"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Your account is ready to use. You will be redirected to the Home page in a few seconds..",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF212121),
            ),
          ),
          Lottie.asset(
            'assets/lottie/zagruzka.json',
            width: size.width * 0.232,
            height: size.height * 0.11,
          ),
        ],
      ),
    );
  }
}