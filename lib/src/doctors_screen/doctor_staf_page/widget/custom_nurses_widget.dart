import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/constants/app_images.dart';
import '../../../common/utils/custom_shadow.dart';

class CustomNursesWidget extends StatelessWidget {
  const CustomNursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            CustomShadow.shadow,
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
               Expanded(
                child: Image(
                  image: AssetImage(AppImages.doctor2),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.45,
                            child: const Text(
                              "Dr. Travis Westaby",
                              style: TextStyle(
                                fontSize: 19,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SvgPicture.asset(AppIcons.favorite2),
                        ],
                      ),
                      const Divider(),
                      const Text(
                        "Cardiologists",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset(AppIcons.star),
                          ),
                          const Text("4.8  (4,279 reviews)"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}