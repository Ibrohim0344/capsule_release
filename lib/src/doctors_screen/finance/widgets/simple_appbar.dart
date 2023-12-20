import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';

class SimpleAppBar extends StatelessWidget {
  final String text;
  final bool isBack;

  const SimpleAppBar({
    required this.text,
    this.isBack = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      leadingWidth: isBack ? 60 : 10,
      leading: isBack ? const BackButton() : const SizedBox.shrink(),
    );
  }
}
