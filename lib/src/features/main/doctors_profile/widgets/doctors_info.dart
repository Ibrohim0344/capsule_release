import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/context_utils.dart';

class DoctorsInfo extends StatelessWidget {
  final String title;
  final String info;
  final bool? withMore;

  const DoctorsInfo({
    required this.title,
    required this.info,
    this.withMore = false,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            title: title,
          ),
          withMore!
              ? ReadMoreText(
                  info,
                  trimLines: 4,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: " view more",
                  trimExpandedText: " view less",
                  moreStyle: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColor,
                  ),
                  // moreStyle: const TextStyle(
                  //   color: AppColors.mainColor,
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  info,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  final void Function()? seeAll;

  const TitleText({
    required this.title,
    this.seeAll,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        seeAll != null
            ? TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: seeAll,
                child: Text(
                  "See All",
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
