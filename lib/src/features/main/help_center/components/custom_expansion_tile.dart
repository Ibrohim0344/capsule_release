import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../common/utils/custom_shadow.dart';

class CustomExpansionTile extends StatelessWidget {
  final String question;
  final String answer;
  final void Function(bool) onExpansionChanged;
  final bool isCollapsed;

  const CustomExpansionTile({
    required this.question,
    required this.answer,
    required this.onExpansionChanged,
    required this.isCollapsed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .038,
        vertical: 8,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[CustomShadow.shadow],
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: AppColors.whiteColor,
        ),
        child: ExpansionTile(
          title: Text(question),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          onExpansionChanged: onExpansionChanged,
          trailing: isCollapsed
              ? SvgPicture.asset(AppIcons.expTrailing)
              : RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(AppIcons.expTrailing),
                ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          childrenPadding: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 8,
          ),
          children: [
            const Divider(),
            Text(answer),
          ],
        ),
      ),
    );
  }
}
