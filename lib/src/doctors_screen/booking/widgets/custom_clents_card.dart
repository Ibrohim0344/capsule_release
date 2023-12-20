import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_images.dart';
import '../../../common/utils/custom_shadow.dart';

class CustomClientsCard extends StatelessWidget {
  final bool isActive;

  const CustomClientsCard({
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      width: double.infinity,
      height: 100,
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
              Stack(
                children: [
                  const Image(
                    image: AssetImage(AppImages.doc2),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: CircleAvatar(
                        backgroundColor:
                            isActive ? AppColors.green : AppColors.red,
                      ),
                    ),
                  )
                ],
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
                      SizedBox(
                        width: size.width * 0.45,
                        child: const Text(
                          "Samandar Takhirov",
                          style: TextStyle(
                            fontSize: 19,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const Text(
                        "Hello Doctor. I need your consultation",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
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
