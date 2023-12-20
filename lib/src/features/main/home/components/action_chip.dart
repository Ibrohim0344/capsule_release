import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/app_colors.dart';
import '../controller/home_provider.dart';

class MyActionChip extends StatelessWidget {
  const MyActionChip({
    required this.categories,
    required this.onPressed,
    super.key,
  });

  final List categories;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            categories.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ActionChip(
                shape: const StadiumBorder(),
                backgroundColor: categories[index].isSelected
                    ? AppColors.blue
                    : AppColors.white,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                side: const BorderSide(
                  width: 1.7,
                  color: AppColors.blue,
                ),
                label: Text(
                  categories[index].categoryName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: categories[index].isSelected
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                onPressed: () =>
                    context.read<HomeProvider>().selectCategories(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
