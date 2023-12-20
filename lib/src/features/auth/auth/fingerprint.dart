import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

import 'dialog.dart';

class Fingerprint extends StatefulWidget {
  const Fingerprint({super.key});

  @override
  State<Fingerprint> createState() => _FingerprintState();
}

class _FingerprintState extends State<Fingerprint> {
  ValueNotifier<bool> fingerprint = ValueNotifier<bool>(false);
  final ValueNotifier<List<BiometricType>?> _availableBiometrics=ValueNotifier([]);
  LocalAuthentication authentication = LocalAuthentication();

  Future<void> _checkForBiometric() async {
    bool? hasBiometric;
    try {
      hasBiometric = await authentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    fingerprint.value = hasBiometric??false;
  }

  Future<void> _getListonBiometric() async {
    List<BiometricType>? ListonBiometric;
    try {
      ListonBiometric = await authentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    _availableBiometrics.value = ListonBiometric;
  }

  Future<void> _getAuthentication() async {
    bool isAutherized = false;
    try {
      isAutherized = await authentication.authenticate(
          localizedReason: "SCAN YOUR FINGER PRINT TO GET AUTHORIZED",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: false,
            biometricOnly: true,
          ));
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
    }
  }

  void showModalDialog() => showDialog(
    context: context,
    builder: (context) => const CongratulationsDialog(),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Set Your Fingerprint",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Add a fingerprint to make your account more secure.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              ValueListenableBuilder(
                valueListenable: fingerprint,
                builder: (context, value, child) {
                  return SvgPicture.asset(
                    "assets/images/fingerprint.svg",
                    colorFilter: const ColorFilter.matrix([12,23]),
                  );
                },
              ),
              const Text(
                "Please put your finger on the fingerprint scanner to get started.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      minimumSize: Size(size.width * 0.42, size.height * 0.065),
                      backgroundColor: const Color(0xFFE9F0FF),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  FilledButton(
                    onPressed: showModalDialog,
                    style: FilledButton.styleFrom(
                      minimumSize: Size(size.width * 0.42, size.height * 0.065),
                      backgroundColor: const Color(0xFF246BFD),
                    ),
                    child: const Text("Continue"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}