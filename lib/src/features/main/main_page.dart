import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/utils/context_utils.dart';
import 'history_page/message_page/message_history_page.dart';
import 'home/home_page.dart';
import 'user_appointments/appointments.dart';
import 'user_profile/profile_page.dart';
import 'wallet_page/wallet_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          HomePage(),
          Appointments(),
          HistoryPage(),
          WalletPage(),
          ProfilePage(),
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
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(AppIcons.home),
            activeIcon: SvgPicture.asset(AppIcons.homeActive),
          ),
          BottomNavigationBarItem(
            label: "Appointments",
            icon: SvgPicture.asset(AppIcons.appointments),
            activeIcon: SvgPicture.asset(AppIcons.appointmentsActive),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: SvgPicture.asset(AppIcons.history),
            activeIcon: SvgPicture.asset(AppIcons.historyActive),
          ),
          BottomNavigationBarItem(
            label: "Wallet",
            icon: SvgPicture.asset(
              AppIcons.icWallet,
              color: AppColors.realGrey,
            ),
            activeIcon: SvgPicture.asset(AppIcons.icWallet),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SvgPicture.asset(AppIcons.profile),
            activeIcon: SvgPicture.asset(AppIcons.profileActive),
          ),
        ],
      );
}
