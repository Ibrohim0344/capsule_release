
import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../../common/utils/custom_shadow.dart';

class CustomCard extends StatelessWidget {
  final Size size;
  final String cardName;
  final String userName;
  final int balance;
  final String logoPath;

  const CustomCard({
    required this.size,
    required this.cardName,
    required this.userName,
    required this.logoPath,
    required this.balance,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5,
      ),
      child: SizedBox(
        width: size.width,
        height: 90,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              CustomShadow.shadow,
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10,
            ),
            child: Row(
              children: [
                Image(
                  width: size.width * 0.1,
                  height: size.width * 0.1,
                  image: AssetImage(
                    logoPath,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      cardName,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      userName,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "$balance",
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}