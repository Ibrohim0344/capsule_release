import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/constants/app_images.dart';
import '../../../common/utils/context_utils.dart';
import '../../../common/utils/custom_shadow.dart';
import '../../../features/main/doctors_profile/widgets/bottom_navigation_button.dart';
import '../../../features/main/doctors_profile/widgets/doctors_info.dart';
import '../../../features/main/doctors_profile/widgets/doctors_rating.dart';

class ClientProfile extends StatefulWidget {
  const ClientProfile({super.key});

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Open Chat",
        onTap: () {},
      ),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: const Text("User Information"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.icMore,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: SizedBox(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage(
                          AppImages.doctorsProfile,
                        ),
                        width: 100,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Alisa Yandex",
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainColor,
                            ),
                          ),
                          Text(
                            "01.01.2000",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            "Female",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DoctorsRating(
                  aboutRating: "Temperature",
                  imagePath: AppIcons.icUsers,
                  ratingText: "37.5",
                ),
                DoctorsRating(
                  aboutRating: "High",
                  imagePath: AppIcons.icRating,
                  ratingText: "175",
                ),
                DoctorsRating(
                  ratingText: "65",
                  aboutRating: "Weight",
                  imagePath: AppIcons.icStar,
                ),
                DoctorsRating(
                  ratingText: "45",
                  aboutRating: "Heart",
                  imagePath: AppIcons.icComment,
                ),
              ],
            ),
          ),
          const DoctorsInfo(
            title: "Clent's Problem",
            info:
                "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
          ),
        ],
      ),
    );
  }
}
