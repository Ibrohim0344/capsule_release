import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../common/constants/app_colors.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({super.key});

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  String smsCode = '';
  FocusNode focusNode=FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create New PIN",
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
              "Add a PIN number to make your account more secure.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 23,
                color: Color(0xFF212121),
              ),
            ),
            SizedBox(height: size.height * 0.15),
            Pinput(
              separatorBuilder: (index) => SizedBox(width: size.width*0.06),
              focusNode: focusNode,
              onTapOutside: (event) => focusNode.unfocus(),
              length: 4,
              defaultPinTheme: PinTheme(
                width: size.width * 0.17,
                height: size.height * 0.09,
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
              onPressed: () {},
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