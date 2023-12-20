import 'package:flutter/material.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/utils/context_utils.dart';
import '../../../../../common/utils/custom_shadow.dart';

class SelectedCard extends StatefulWidget {
  final String cardName;
  final String cardIcon;

  const SelectedCard({
    required this.cardIcon,
    required this.cardName,
    super.key,
  });

  @override
  State<SelectedCard> createState() => _SelectedCardState();
}

class _SelectedCardState extends State<SelectedCard> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (value == 0) {
            value = 1;
          } else {
            value = 0;
          }
        });
      },
      child: SizedBox(
        height: 80,
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
              horizontal: 8.0,
              vertical: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: Image(
                        image: AssetImage(widget.cardIcon),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Text(
                      widget.cardName,
                      style:context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                Radio(
                  value: value,
                  groupValue: 0,
                  activeColor: AppColors.mainColor,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
