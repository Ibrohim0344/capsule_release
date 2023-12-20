import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/custom_doctor_card.dart';

class TopDoctors extends StatelessWidget {
  const TopDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text(
          "Top Doctors",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
      ),
      backgroundColor: AppColors.whiteColor,
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: size.width * .038,
          ),
          child: const CustomDoctorCard(),
        ),
      ),
    );
  }
}
