import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/custom_shadow.dart';



class ContactButton extends StatelessWidget {
  final String iconPath;
  final String title;

  final void  Function() onTap;

  const ContactButton({
    required this.iconPath,
    required this.title,
    required this.onTap,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: size.width * .038,
      ),
      child: DecoratedBox(
        decoration:  const BoxDecoration(
          borderRadius:  BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: <BoxShadow>[CustomShadow.shadow],
          color: AppColors.whiteColor,
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(8),
          leading: SvgPicture.asset(iconPath),
          title: Text(title),
        ),
      ),
    );
  }
}
