import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/constants/app_colors.dart';
import '../common/constants/app_icons.dart';
import '../common/constants/app_images_doctor.dart';
import '../common/utils/context_utils.dart';
import 'booking/booking_page.dart';
import 'dashboard/dashboard_page.dart';
import 'finance/finance_page.dart';
import 'sales/sales_page.dart';
import 'team/team_page.dart';

class DoctorsMainPage extends StatefulWidget {
  const DoctorsMainPage({super.key});

  @override
  State<DoctorsMainPage> createState() => _DoctorsMainPageState();
}

class _DoctorsMainPageState extends State<DoctorsMainPage> {
  late final PageController controller;
  int pageNumber = 0;

  void onPageChanged(int value) {
    controller.jumpToPage(value);
    setState(() => pageNumber = value);
  }

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: onPageChanged,
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          DashboardPage(),
          Team(),
          BookingPage(),
          FinancePage(),
          SalesPage(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        pageNumber: pageNumber,
        onPageChanged: onPageChanged,
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int pageNumber;
  final void Function(int) onPageChanged;

  const CustomNavigationBar({
    required this.pageNumber,
    required this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: pageNumber,
        onTap: onPageChanged,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 12,
        // unselectedFontSize: 12,
        selectedLabelStyle: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: AppColors.blue,
        items: [
          const BottomNavigationBarItem(
            label: "Dashboard",
            icon: Image(
              image: AssetImage(AppImagesDoctor.icDashboard),
              color: AppColors.tabBarUnSelected,
              width: 24,
              height: 24,
            ),
            activeIcon: Image(
              image: AssetImage(AppImagesDoctor.icDashboard),
              color: AppColors.mainColor,
              width: 24,
              height: 24,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Team",
            icon: Image(
              image: AssetImage(AppImagesDoctor.icStaff),
              color: AppColors.tabBarUnSelected,
              width: 24,
              height: 24,
            ),
            activeIcon: Image(
              image: AssetImage(AppImagesDoctor.icStaff),
              color: AppColors.mainColor,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "Booking",
            icon: SvgPicture.asset(
              AppIcons.history,
            ),
            activeIcon: SvgPicture.asset(
              AppIcons.historyActive,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Finance",
            icon: Image(
              image: AssetImage(AppImagesDoctor.icFinance),
              color: AppColors.tabBarUnSelected,
              width: 24,
              height: 24,
            ),
            activeIcon: Image(
              image: AssetImage(AppImagesDoctor.icFinance),
              color: AppColors.mainColor,
              width: 24,
              height: 24,
            ),
          ),
          const BottomNavigationBarItem(
            label: "Sales",
            icon: Image(
              image: AssetImage(AppImagesDoctor.icSales),
              color: AppColors.tabBarUnSelected,
              width: 24,
              height: 24,
            ),
            activeIcon: Image(
              image: AssetImage(AppImagesDoctor.icSales),
              color: AppColors.mainColor,
              width: 24,
              height: 24,
            ),
          ),
        ],
      );
}
