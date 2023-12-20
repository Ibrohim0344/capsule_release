import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/context_utils.dart';

class HistoryListTile extends StatelessWidget {
  final String mainText;
  final String iconPNG;
  final String price;

  const HistoryListTile({
    required this.mainText,
    required this.price,
    required this.iconPNG,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: SizedBox(
          width: 32,
          height: 32,
          child: Image.asset(iconPNG),
        ),
        title: Text(
          mainText,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          "+$price som",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
