import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_icons.dart';
import '../../../../../common/utils/context_utils.dart';

class CustomChips extends StatefulWidget {
  const CustomChips({super.key});

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  int defaultChoose = 6;
  List<bool> isCheckedList =
      List.generate(6, (index) => index == 5 ? true : false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            index == 5 ? const SizedBox(width: 10) : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              child: SizedBox(
                width: size.width * 0.2,
                height: size.height * 0.04,
                child: ChoiceChip(
                  surfaceTintColor: AppColors.mainColor,
                  showCheckmark: false,
                  onSelected: (value) {
                    setState(() {
                      for (int i = 0; i < isCheckedList.length; i++) {
                        if (i == index) {
                          isCheckedList[i] = value;
                        } else {
                          isCheckedList[i] = false;
                        }
                      }
                    });
                  },
                  side: isCheckedList[index]
                      ? const BorderSide(
                          color: AppColors.mainColor,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )
                      : const BorderSide(
                          color: AppColors.mainColor,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                  shape: const StadiumBorder(),
                  backgroundColor: isCheckedList[index]
                      ? AppColors.mainColor
                      : AppColors.white,
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        AppIcons.icStar,
                        color: isCheckedList[index]
                            ? AppColors.white
                            : AppColors.mainColor,
                        width: 16,
                        height: 16,
                      ),
                      Text(
                        index == 5 ? "All" : "${index + 1}",
                        style:context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isCheckedList[index]
                              ? AppColors.white
                              : AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                  selected: defaultChoose == index,
                ),
              ),
            ),
            index == 0 ? const SizedBox(width: 10) : const SizedBox(),
          ],
        );
      },
      itemCount: 6,
    );
  }
}
