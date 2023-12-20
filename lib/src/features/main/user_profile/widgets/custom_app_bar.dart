import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.title,
    this.leading,
    this.action,
    super.key,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      primary: true,
      leading: leading ?? Padding(
              padding: const EdgeInsets.all(17.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  AppIcons.backIcon,
                ),
              ),
            ),
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                fontFamily: "Urbanist",
                fontWeight: FontWeight.w700,
              )
            )
          : null,
      actions: action,
      elevation: 0,
    );
  }
}
