import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import 'widget/custom_nurses_widget.dart';

class DoctorNursesPage extends StatefulWidget {
  const DoctorNursesPage({super.key});

  @override
  State<DoctorNursesPage> createState() => _DoctorNursesPageState();
}

class _DoctorNursesPageState extends State<DoctorNursesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          title: const Text(
            "Dr. Travis Westaby's Nurses",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          toolbarHeight: 90,
          leadingWidth: 10,
          leading: const SizedBox.shrink(),
        ),
        body: Column(
          children: List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .04, vertical: size.height * .0125),
              child: GestureDetector(
                onTap: () {},
                child: const CustomNursesWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
