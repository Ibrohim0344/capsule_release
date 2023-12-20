import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../common/utils/context_utils.dart';

class DoctorsAppBar extends StatelessWidget {
  final String title;
  final void Function()? backTap;
  final bool? isLike;
  final bool? isMore;
  final void Function()? likeTap;
  final void Function()? moreTap;
  final PreferredSizeWidget? bottom;

  const DoctorsAppBar({
    this.backTap,
    required this.title,
    this.likeTap,
    this.bottom,
    this.moreTap,
    this.isLike = false,
    this.isMore = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      surfaceTintColor: AppColors.white,
      bottom: bottom,
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.black
        ),
      ),
      actions: [
        isLike!
            ? IconButton(
                icon: SvgPicture.asset(
                  AppIcons.icLike,
                ),
                onPressed: likeTap,
              )
            : const SizedBox(),
        isMore!
            ? IconButton(
                icon: SvgPicture.asset(
                  AppIcons.icMore,
                ),
                onPressed: moreTap,
              )
            : const SizedBox(),
      ],
      leading: IconButton(
        icon: SvgPicture.asset(
          AppIcons.icBack,
        ),
        onPressed: backTap,
      ),
    );
  }
}
