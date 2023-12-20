import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_icons.dart';

class CustomSearchField extends StatelessWidget {
  final bool isEnabled;

  const CustomSearchField({
    this.isEnabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      cursorColor: AppColors.blue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(AppIcons.search),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.searchField,
        hintText: "Search",
        hintStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 14,
        ),
      ),
    );
  }
}
