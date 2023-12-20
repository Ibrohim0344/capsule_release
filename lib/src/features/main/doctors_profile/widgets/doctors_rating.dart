import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/context_utils.dart';
import 'icon_with_bkg.dart';

class DoctorsRating extends StatelessWidget {
  final String imagePath;
  final String ratingText;
  final String aboutRating;

  const DoctorsRating({
    required this.imagePath,
    required this.ratingText,
    required this.aboutRating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.14,
      width: size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconWithBKG(
            imagePath: imagePath,
          ),
          Text(
            ratingText,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
            ),
          ),
          Text(
            aboutRating,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.simpleText,
            ),
          ),
        ],
      ),
    );
  }
}
