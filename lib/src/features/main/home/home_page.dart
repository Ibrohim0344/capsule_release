import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/constants/app_images.dart';
import '../../../common/services/storage/storage.dart';
import '../../../common/utils/context_utils.dart';
import '../../../common/utils/custom_doctor_card.dart';
import '../../../common/utils/custom_search_field.dart';
import '../doctors_profile/doctors_profile.dart';
import 'components/action_chip.dart';
import 'components/ads_card.dart';
import 'components/carousel_widgets.dart';
import 'components/category_widget.dart';
import 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: AppColors.blue,
            foregroundImage: AssetImage(AppImages.doc2),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning 👋",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.gray,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "${$currentUser.currentUser!.name} ${$currentUser.currentUser!.lastName}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: openSupportPage,
            child: SvgPicture.asset(AppIcons.support),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: openNotificationPage,
              child: SvgPicture.asset(AppIcons.notifications),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .038,
              vertical: size.width * .023,
            ),
            child: GestureDetector(
              onTap: openSearchPage,
              child: const CustomSearchField(isEnabled: false),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 13,
              horizontal: size.width * .01,
            ),
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) =>
                      AdsCard(size: size),
                  options: CarouselOptions(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    viewportFraction: 1,
                    height: 180,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnManualNavigate: true,
                    onPageChanged: (index, reason) => setState(
                      () => activeIndex = index,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 165),
                  child: Center(
                    child: BuildIndicator(activeIndex: activeIndex),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .033),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Doctor Speciality",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    CategoryWidget(
                      category: AppIcons.general,
                      text: "General",
                    ),
                    CategoryWidget(
                      category: AppIcons.dentist,
                      text: "Dentist",
                    ),
                    CategoryWidget(
                      category: AppIcons.ophthalmologist,
                      text: "Ophthalmologist",
                    ),
                    CategoryWidget(
                      category: AppIcons.nutritionist,
                      text: "Nutritionist",
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    CategoryWidget(
                      category: AppIcons.neurologist,
                      text: "Neurologist",
                    ),
                    CategoryWidget(
                      category: AppIcons.pediatric,
                      text: "Pediatric",
                    ),
                    CategoryWidget(
                      category: AppIcons.radiologist,
                      text: "Radiologist",
                    ),
                    CategoryWidget(
                      category: AppIcons.more,
                      text: "More",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .033),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Doctors",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: openTopDoctors,
                  child: Text(
                    "See All",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: MyActionChip(categories: categories),
            ),
          ),
          Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * .04,
                  vertical: size.height * .0125,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorProfile(),
                    ),
                  ),
                  child: const CustomDoctorCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
