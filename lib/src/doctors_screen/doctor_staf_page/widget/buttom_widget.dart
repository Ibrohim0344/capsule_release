import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/app_icons.dart';
import '../../team/widgets/doctor_reviews.dart';
import '../../team/widgets/doctor_settings.dart';
import '../../team/widgets/doctor_work_history.dart';
import '../doctor_nurses_page.dart';

class RoundedBox extends StatelessWidget {
  final int index;

  RoundedBox({super.key, required this.index});

  List<String> imagePaths = [
    AppIcons.icUsers,
    AppIcons.icRating,
    AppIcons.star,
    AppIcons.icComment,
  ];

  List<String> title = [
    "Edit roles",
    "Reviews",
    "Work history",
    "Nurses",
  ];

  List<Widget> pages = [
    const DoctorSettings(),
    const DoctorReviewPage(),
    const DoctorWorkHistory(),
    const DoctorNursesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (index >= 0 && index < pages.length) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pages[index]));
            }
          },
          child: SizedBox(
            height: 60,
            width: 60,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Color(0xFFECF2FD),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: SvgPicture.asset(
                  imagePaths[index],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [Text(title[index])],
        )
      ],
    );
  }
}
