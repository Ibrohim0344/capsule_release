import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/utils/context_utils.dart';
import '../../common/utils/custom_doctor_card.dart';
import '../../features/main/help_center/help_center.dart';
import '../../features/main/home/components/action_chip.dart';
import 'widgets/department_widgets.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  List<QuestionType> categories = [
    QuestionType(categoryName: "General"),
    QuestionType(categoryName: "Account"),
    QuestionType(categoryName: "Service"),
    QuestionType(categoryName: "Payment"),
  ];

  List<String> contactIcons = [
    AppIcons.general,
    AppIcons.dentist,
    AppIcons.ophthalmologist,
    AppIcons.nutritionist,
    AppIcons.pediatric,
    AppIcons.radiologist,
  ];

  List<String> contactTitles = [
    "General",
    "Dentist",
    "Ophthalmologist",
    "Nutritionist",
    "Pediatric",
    "Radiologist",
  ];

  void selectCategories(int value) {
    for (int i = 0; i < categories.length; i++) {
      if (i == value) {
        categories[i].isSelected = true;
      } else {
        categories[i].isSelected = false;
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    categories[0].isSelected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.search,
                color: AppColors.black,
              ),
            )
          ],
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          title: const Text(
            "Our Team",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          leadingWidth: 10,
          leading: const SizedBox.shrink(),
          bottom: TabBar(
            indicatorColor: AppColors.blue,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            labelStyle: context.textTheme.titleMedium?.copyWith(
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
            unselectedLabelColor: AppColors.lightGray,
            tabs: const [
              Tab(
                text: "Staff",
              ),
              Tab(
                text: "Department",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TabBarView(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * .02),
                    child: MyActionChip(
                      categories: categories,
                      onPressed: selectCategories,
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
                          onTap: () {},
                          child: const CustomDoctorCard(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => DepartmentWidgets(
                  iconPath: contactIcons[index],
                  title: contactTitles[index],
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
