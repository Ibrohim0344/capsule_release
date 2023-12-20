import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.category,
    required this.text,
    super.key,
  });

  final String category;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: AppColors.lightBlue,
            child: SvgPicture.asset(category),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
