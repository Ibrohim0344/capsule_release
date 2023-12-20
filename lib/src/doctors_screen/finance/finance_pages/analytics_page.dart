import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../features/main/doctors_profile/widgets/bottom_navigation_button.dart';
import '../widgets/simple_appbar.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Coming soon",
        // onTap: () => onTap(number),
        onTap: () {},
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          size.height * 0.06,
        ),
        child: const SimpleAppBar(
          text: "Analytics",
          isBack: true,
        ),
      ),
    );
  }
}
