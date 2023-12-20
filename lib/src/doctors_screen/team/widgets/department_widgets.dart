import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/context_utils.dart';
import '../../../common/utils/custom_shadow.dart';

class DepartmentWidgets extends StatefulWidget {
  final String iconPath;
  final String title;
  final bool? isTrialing;

  final void Function() onTap;

  const DepartmentWidgets({
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.isTrialing = true,
    super.key,
  });

  @override
  State<DepartmentWidgets> createState() => _DepartmentWidgetsState();
}

class _DepartmentWidgetsState extends State<DepartmentWidgets> {
  bool isAdded = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: size.width * .038,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: <BoxShadow>[
            CustomShadow.shadow,
          ],
          color: AppColors.whiteColor,
        ),
        child: ListTile(
          onTap: widget.onTap,
          contentPadding: const EdgeInsets.all(8),
          leading: SvgPicture.asset(
            widget.iconPath,
            color: AppColors.mainColor,
            width: 24,
            height: 24,
          ),
          title: Text(widget.title),
          trailing: widget.isTrialing! ? FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: isAdded ? AppColors.mainColor : AppColors.white,
              side: BorderSide(
                color: isAdded ? AppColors.white : AppColors.mainColor,
              ),
            ),
            child: Text(
              isAdded ? "Add" : "Added",
              style: context.textTheme.bodyMedium?.copyWith(
                color: isAdded ? AppColors.white : AppColors.mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              setState(() {
                isAdded = !isAdded;
              });
            },
          ) : SizedBox.shrink(),
        ),
      ),
    );
  }
}
