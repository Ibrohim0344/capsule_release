import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/custom_doctor_card.dart';

class DoctorSettings extends StatefulWidget {
  const DoctorSettings({super.key});

  @override
  State<DoctorSettings> createState() => _DoctorSettingsState();
}

class _DoctorSettingsState extends State<DoctorSettings> {
  List<String> switchNames = [
    "General Notification",
    "Sound",
    "Vibrate",
    "Special Offers",
    "Promo & Discount",
    "Payments",
    "Cashback",
    "App Updates",
    "New Service Available",
    "New Tips Available",
  ];

  List<bool> switchValues = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Dr. Travis Westaby",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Urbanist',
          ),
        ),
      ),
      body: Column(
        children: [
          const CustomDoctorCard(),
          for (int i = 0; i < 10; i++)
            ListTile(
              title: Text(
                switchNames[i],
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Urbanist',
                  letterSpacing: 0.20,
                ),
              ),
              trailing: Switch(
                value: switchValues[i],
                onChanged: (bool newValue) {
                  setState(() {
                    switchValues[i] = newValue;
                    if (newValue) {
                    } else {}
                  });
                },
                activeColor: AppColors.whiteColor,
                activeTrackColor: AppColors.mainColor,
                inactiveThumbColor: AppColors.whiteColor,
                inactiveTrackColor: Colors.grey[200],
                trackOutlineColor:
                    MaterialStateProperty.all(AppColors.whiteColor),
              ),
            ),
        ],
      ),
    );
  }
}
