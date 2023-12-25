import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_images.dart';
import '../../../features/main/doctors_profile/reviews/widgets/custom_chips.dart';
import '../../../features/main/doctors_profile/widgets/doctors_app_bar.dart';
import '../../../features/main/doctors_profile/widgets/reviews_widget.dart';

class DoctorReviewPage extends StatefulWidget {
  const DoctorReviewPage({super.key});

  @override
  State<DoctorReviewPage> createState() => _DoctorReviewPageState();
}

class _DoctorReviewPageState extends State<DoctorReviewPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.12,
        ),
        child: DoctorsAppBar(
          title: "4.8 (4,942 reviews)",
          isMore: true,
          backTap: () {
            Navigator.pop(context);
          },
          bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: ColoredBox(
              color: AppColors.white,
              child: SizedBox(
                width: size.width,
                height: 38,
                child: const CustomChips(),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Reviews(
              commentCreatedAt: index,
              commentLikeCount: index * 3,
              profileImage: AppImages.doctorsProfile,
              userName: "Lauralee Quintero",
              likeCount: index % 5,
              comment:
                  "Dr. Jenny is very professional in her work and responsive.",
            ),
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
