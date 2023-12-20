import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/utils/context_utils.dart';
import 'cancelled_appointments/cancelled.dart';
import 'completed_appointments/completed.dart';
import 'upcoming_appointments/upcoming.dart';

class MyAppointments extends StatelessWidget {
  const MyAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          title: const Text(
            "My Appointments",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.search,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.icMore,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            labelColor: AppColors.blueColor,
            unselectedLabelColor: AppColors.tabBarUnSelected,
            indicatorColor: AppColors.blueColor,
            indicatorWeight: 4,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: const [
              Tab(
                text: "Upcoming",
              ),
              Tab(
                text: "Completed",
              ),
              Tab(
                text: "Cancelled",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Upcoming(),
            ),
            Center(
              child: Completed(),
            ),
            Center(
              child: Cancelled(),
            ),
          ],
        ),
      ),
    );
  }
}
