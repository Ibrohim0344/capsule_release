import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/constants/app_images.dart';
import 'book_appointment/package_page/package_page.dart';
import 'reviews/reviews_page.dart';
import 'widgets/bottom_navigation_button.dart';
import 'widgets/doctors_about_card.dart';
import 'widgets/doctors_app_bar.dart';
import 'widgets/doctors_info.dart';
import 'widgets/doctors_rating.dart';
import 'widgets/reviews_widget.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController?.dispose();
  }

  void openReviewsPage() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReviewsPage(),
        ),
      );

  void openPackagePage() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PackagePage(),
        ),
      );

  void back() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Book Appointment",
        onTap: openPackagePage,
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.23,
        ),
        child:  DoctorsAppBar(
          title: "Dr. Jenny Watson",
          isLike: true,
          isMore: true,
          backTap: back,
          bottom: const PreferredSize(
            preferredSize: Size(0, 0),
            child: ColoredBox(
              color: AppColors.white,
              child: DoctorsAboutCard(
                isActive: true,
                doctorName: "Dr. Jenny Watson",
                doctorProfession: "Immunologists",
                profileImage: AppImages.doctorsProfile,
                workPlace: "Christ Hospital in London, UK",
              ),
            ),
          ),
        ),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: ColoredBox(
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.02,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DoctorsRating(
                            aboutRating: "patients",
                            imagePath: AppIcons.icUsers,
                            ratingText: "5,000+",
                          ),
                          DoctorsRating(
                            aboutRating: "years experins",
                            imagePath: AppIcons.icRating,
                            ratingText: "10+",
                          ),
                          DoctorsRating(
                            ratingText: "4.8",
                            aboutRating: "rating",
                            imagePath: AppIcons.icStar,
                          ),
                          DoctorsRating(
                            ratingText: "4,942",
                            aboutRating: "reviews",
                            imagePath: AppIcons.icComment,
                          ),
                        ],
                      ),
                    ),
                    const DoctorsInfo(
                      withMore: true,
                      title: "About me",
                      info:
                          "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
                    ),
                    const DoctorsInfo(
                      title: "Working Time",
                      info: "Monday - Friday, 08.00 AM - 20.00 PM",
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: MySliverHeaderDelegate(
                openReviewsPage: openReviewsPage,
                size: size,
              ),
              pinned: true,
            ),
          ];
        },
        body: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.005,
            ),
            child: Reviews(
              commentCreatedAt: index + 1,
              commentLikeCount: 5665,
              profileImage: AppImages.doctorsProfile,
              userName: "Lauralee Quintero",
              likeCount: 5,
              comment:
                  "Dr. Jenny is very professional in her work and responsive. I have consulted and my problem is solved. 😍😍",
            ),
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}

class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Size size;
  final void Function()? openReviewsPage;

  MySliverHeaderDelegate({
    required this.openReviewsPage,
    required this.size,
  });

  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.02,
        ),
        child: TitleText(
          title: "Reviews",
          seeAll: openReviewsPage,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

