import 'package:flutter/material.dart';

import '../../../../../../../common/constants/app_colors.dart';
import '../../../../../../../common/utils/context_utils.dart';

class DialogButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final bool? buttonIsFill;

  const DialogButton({
    required this.text,
    required this.onTap,
    this.buttonIsFill = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: FilledButton(
        style: FilledButton.styleFrom(
          elevation: 0,
          backgroundColor: buttonIsFill! ? AppColors.mainColor : AppColors.outlineButtonColor,
        ),
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium?.copyWith(
            color: buttonIsFill! ? AppColors.white : AppColors.mainColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
