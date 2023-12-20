
import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_images.dart';
import '../doctors_profile.dart';
import '../widgets/doctors_app_bar.dart';
import '../widgets/reviews_widget.dart';
import 'widgets/custom_chips.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  void back() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DoctorProfile(),
        ),
      );

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
          backTap: back,
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
