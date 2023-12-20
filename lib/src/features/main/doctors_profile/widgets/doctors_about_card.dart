import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../../common/utils/custom_shadow.dart';

class DoctorsAboutCard extends StatelessWidget {
  final String doctorName;
  final String doctorProfession;
  final String workPlace;
  final String profileImage;
  final bool? isActive;

  const DoctorsAboutCard({
    required this.doctorName,
    required this.doctorProfession,
    required this.workPlace,
    required this.profileImage,
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.01,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [CustomShadow.shadow],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image(
                  image: AssetImage(profileImage),
                  width: 110,
                  height: 110,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctorName,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: 1,
                      width: size.width * 0.5,
                      child: const ColoredBox(
                        color: AppColors.dividerColor,
                      ),
                    ),
                  ),
                  Text(
                    doctorProfession,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    workPlace,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    isActive! ? "• Active" : "• Offline",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isActive! ? AppColors.green : AppColors.red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
