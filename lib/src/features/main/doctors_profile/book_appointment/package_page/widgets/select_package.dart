import 'package:flutter/material.dart';

import '../../../../../../common/constants/app_colors.dart';
import '../../../../../../common/constants/app_icons.dart';
import '../../../../../../common/utils/context_utils.dart';
import '../../../../../../common/utils/custom_shadow.dart';
import '../../../widgets/icon_with_bkg.dart';

class SelectPackage extends StatelessWidget {
  final String packageText;
  final String infoText;
  final double? oldPrice;
  final double? price;
  final int? minutes;

  const SelectPackage({
    required this.infoText,
    required this.packageText,
    this.price,
    this.oldPrice,
    this.minutes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 120,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            CustomShadow.shadow
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const IconWithBKG(
                      imagePath: AppIcons.icComment,
                    ),
                    SizedBox(width: size.width * 0.05),
                    SizedBox(
                      width: price != null ? size.width * 0.3 : size.width * 0.5,
                      height: size.height * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            packageText,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            infoText,
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  oldPrice != null
                      ? Text(
                          "$oldPrice",
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      : const SizedBox.shrink(),
                  price != null
                      ? Text(
                          "$price",
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            decorationStyle: TextDecorationStyle.wavy,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : const SizedBox.shrink(),
                  minutes != null
                      ? Text(
                          "for $minutes minutes",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            decorationStyle: TextDecorationStyle.wavy,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              Radio(
                value: price == null ? null : 0,
                groupValue: 0,
                activeColor: AppColors.mainColor,
                onChanged: (value) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
