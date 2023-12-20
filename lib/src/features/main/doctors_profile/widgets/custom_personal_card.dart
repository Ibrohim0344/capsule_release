import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_images.dart';
import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/context_utils.dart';

class CustomPersonalCard extends StatelessWidget {
  const CustomPersonalCard({super.key});

  @override
  Widget build(BuildContext context) {
    // String fakeNumber = $currentUser.currentUser!.cardModel.number;
    final size = MediaQuery.sizeOf(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Color(0x40246BFD),
            blurRadius: 24,
            spreadRadius: 0,
            offset: Offset(4, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Image(
            image: AssetImage(
              AppImages.cardFrame,
            ),
          ),
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.02,
            child: Text(
              "CapsuleCard",
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.05,
            child: Text(
              // $currentUser.currentUser!.name,
              "Samandar",
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.09,
            child: Text(
              "Your balance",
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.11,
            child: Text(
              // "${$currentUser.currentUser!.cardModel.quantity} UZS",
              "500 000",
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.08,
            top: size.height * 0.17,
            child: Row(
              children: [
                Text(
                  "fakeNumber",
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy_outlined,
                  ),
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
