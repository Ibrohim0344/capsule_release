import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/constants/app_images.dart';
import '../../common/utils/custom_search_field.dart';
import 'profile/doctors_profile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void openDoctorsProfile() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DoctorsProfile(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: openDoctorsProfile,
            child: const CircleAvatar(
              backgroundColor: AppColors.blue,
              foregroundImage: AssetImage(AppImages.doc2),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "•Active",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.greenDeep,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "Dr. Dilmurod Ergashev",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.support),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AppIcons.notifications),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .038,
              vertical: size.width * .023,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const CustomSearchField(isEnabled: false),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20,
            ),
            child: SizedBox(
              height: 200,
              child: Center(
                // child: PieChart(
                //   PieChartData(
                //     centerSpaceRadius: 80,
                //     sectionsSpace: 1,
                //     sections: List.generate(
                //       8,
                //       (index) => PieChartSectionData(
                //         value: index * 2,
                //         color: Colors.primaries[index % 8],
                //         showTitle: true,
                //         title: "Chart $index",
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
