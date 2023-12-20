import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_icons.dart';
import '../../../../../common/utils/context_utils.dart';

class ChatScreenAppBar extends StatelessWidget {
  final String title;
  final void Function()? backTap;
  final void Function()? searchTap;

  const ChatScreenAppBar({
    required this.backTap,
    required this.title,
    required this.searchTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: AppColors.white,
      title: Text(
        title,
        style: context.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.black),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          AppIcons.icBack,
        ),
        onPressed: backTap,
      ),
      actions: [
        IconButton(
          onPressed: searchTap,
          icon: SvgPicture.asset(AppIcons.search),
        )
      ],
    );
  }
}
