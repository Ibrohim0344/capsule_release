import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_images.dart';
import '../../../../common/utils/context_utils.dart';

class AdsCard extends StatelessWidget {
  final Size size;

  const AdsCard({
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
            color: AppColors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.adsFrame),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Medical Checks!",
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: size.width * .25),
                          child: Text(
                            "Check your health condition regularly to minimize the incidence of disease in the future.",
                            style: context.textTheme.labelSmall?.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.white,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Check Now",
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(35),
                  ),
                  child: Transform.scale(
                    scale: .92,
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.bottomCenter,
                    child: const Image(
                      image: AssetImage(AppImages.doc1),
                    ),
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
