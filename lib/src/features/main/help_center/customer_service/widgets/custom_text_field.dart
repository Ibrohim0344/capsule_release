import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_icons.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool check;

  final void Function(String text) onChanged;

  const CustomTextField({
    required this.onChanged,
    required this.check,
    required this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        onChanged: onChanged,
        controller: textEditingController,
        textInputAction: TextInputAction.newline,
        cursorColor: AppColors.blue,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          focusColor: AppColors.blue,
          hintText: "Type a message...",
          prefixIcon: IconButton(
            icon: SvgPicture.asset(
              AppIcons.icSmile,
              color: check == false ? AppColors.greyScale : AppColors.blue,
            ),
            iconSize: 20,
            onPressed: () {},
          ),
          // suffixIcon: Row(
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: SvgPicture.asset(AppIcons.icVector),
          //     ),
          //     IconButton(
          //       onPressed: () {},
          //       icon: SvgPicture.asset(AppIcons.icFoto),
          //     ),
          //   ],
          // ),
          hintStyle: const TextStyle(
            color: AppColors.greyScale,
          ),
          fillColor: Colors.blue.shade200,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
