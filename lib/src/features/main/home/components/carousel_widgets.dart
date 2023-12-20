import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/constants/app_colors.dart';

class BuildIndicator extends StatelessWidget {
  final int activeIndex;

  const BuildIndicator({
    required this.activeIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 5,
      effect: const ExpandingDotsEffect(
        dotWidth: 5,
        dotHeight: 5,
        expansionFactor: 3.5,
        activeDotColor: AppColors.white,
        dotColor: AppColors.searchField,
      ),
    );
  }
}
