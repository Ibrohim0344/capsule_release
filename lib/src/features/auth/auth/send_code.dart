import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../common/constants/app_colors.dart';
import '../../main/main_page.dart';

class SendCode extends StatefulWidget {
  const SendCode({
    required this.verificationId,
    super.key,
  });

  final String verificationId;

  @override
  State<SendCode> createState() => _SendCodeState();
}

/// State for widget OtpScreen.
class _SendCodeState extends State<SendCode> {
  String smsCode = '';

  void otpVerification() async {
    final auth = FirebaseAuth.instance;
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: smsCode,
    );
    try {
      final result = await auth.signInWithCredential(credential);
      if (context.mounted && result.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter SMS Code",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xFF212121),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.056),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            const Text(
              "Enter the sms code in order to we make sure",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 23,
                color: Color(0xFF212121),
              ),
            ),
            SizedBox(height: size.height * 0.15),
            Pinput(
              length: 6,
              // obscureText: true,
              // obscuringWidget: CircleAvatar(
              //   backgroundColor: Colors.black,
              //   radius: 10,
              // ),
              defaultPinTheme: PinTheme(
                width: size.width * 0.15,
                height: size.height * 0.08,
                textStyle: const TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(30, 60, 87, 1),
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  color: AppColors.codeBacgroundColors,
                  border:
                  Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: size.width * 0.15,
                height: size.height * 0.08,
                textStyle: const TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(30, 60, 87, 1),
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.codeBacgroundColors),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: size.width * 0.15,
                height: size.height * 0.08,
                textStyle: const TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(30, 60, 87, 1),
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.codeBacgroundColors,
                ),
              ),
              showCursor: true,
              onCompleted: (pin) {
                smsCode = pin;
              },
            ),
            const Spacer(),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.blue,
                minimumSize: Size(double.infinity, size.height * 0.065),
              ),
              onPressed: otpVerification,
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
