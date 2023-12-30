import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/utils/context_utils.dart';
import '../../common/utils/custom_doctor_card.dart';
import '../../features/main/help_center/help_center.dart';
import '../../features/main/home/components/action_chip.dart';
import '../doctor_staf_page/doctor_staf.dart';
import 'widgets/department_widgets.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  List<QuestionType> selectedFilters = [];

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

  void selectCategories(int index) {
    setState(() {
      selectedFilters[index].isSelected = !selectedFilters[index].isSelected;
    });
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
                      categories: selectedFilters,
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DoctorStaffPage()));
                          },
                          child: const CustomDoctorCard(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                itemCount: contactTitles.length,
                itemBuilder: (context, index) => DepartmentWidgets(
                  iconPath: contactIcons[index],
                  title: contactTitles[index],
                  isAdded: selectedFilters.any(
                      (filter) => contactTitles[index] == filter.categoryName),
                  onSelectFilter: (filter) {
                    if (selectedFilters.any((filter) =>
                        contactTitles[index] == filter.categoryName)) {
                      selectedFilters.remove(filter);
                    } else {
                      selectedFilters.add(filter);
                    }
                    setState(() {});
                  },
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
