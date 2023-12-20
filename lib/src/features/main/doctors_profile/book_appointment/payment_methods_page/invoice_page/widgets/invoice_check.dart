import 'package:flutter/material.dart';

import '../../../../../../../common/constants/app_colors.dart';
import '../../../../../../../common/utils/context_utils.dart';
import '../../../../../../../common/utils/custom_shadow.dart';

class InvoiceCheck extends StatelessWidget {
  final String textOne;
  final String mainOne;

  final String textTwo;
  final String mainTwo;

  final String textThree;
  final String mainThree;

  final bool? isDivider;
  final double sizeHeight;

  const InvoiceCheck({
    required this.sizeHeight,
    required this.textOne,
    required this.mainOne,
    required this.textTwo,
    required this.mainTwo,
    required this.textThree,
    required this.mainThree,
    this.isDivider = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            CustomShadow.shadow
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SimpleText(
                text: textOne,
                mainText: mainOne,
              ),
              _SimpleText(
                text: textTwo,
                mainText: mainTwo,
              ),
              isDivider!
                  ? const Divider(
                      color: Color(0x0d04060f),
                    )
                  : const SizedBox(),
              _SimpleText(
                text: textThree,
                mainText: mainThree,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SimpleText extends StatelessWidget {
  final String mainText;
  final String text;

  const _SimpleText({
    required this.mainText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
        ),
        Text(
          mainText,
          style:context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.simpleText,
          ),
        ),
      ],
    );
  }
}
