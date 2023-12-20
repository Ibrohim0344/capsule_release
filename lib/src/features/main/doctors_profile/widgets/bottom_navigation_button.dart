import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/context_utils.dart';

class BottomNavigationButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const BottomNavigationButton({
     required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox.fromSize(
      size: Size(
        size.width,
        size.height * 0.09,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Color(0x40246BFD),
                blurRadius: 24,
                offset: Offset(4, 8),
              ),
            ],
          ),
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              fixedSize: Size(
                size.width * 0.9,
                size.height * 0.2,
              ),
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
