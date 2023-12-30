import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/constants/app_images.dart';
import '../../common/utils/custom_shadow.dart';
import '../../features/main/help_center/help_center.dart';
import '../../features/main/home/components/action_chip.dart';
import 'widget/buttom_widget.dart';

class DoctorStaffPage extends StatefulWidget {
  const DoctorStaffPage({
    super.key,
  });

  @override
  State<DoctorStaffPage> createState() => _DoctorStaffPageState();
}

class _DoctorStaffPageState extends State<DoctorStaffPage> {
  List<QuestionType> categories = [
    QuestionType(categoryName: "All"),
    QuestionType(categoryName: "General"),
    QuestionType(categoryName: "Dentist"),
    QuestionType(categoryName: "Nutritionist"),
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
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.search,
                  color: AppColors.black,
                ),
              ),
            )
          ],
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          title: const Text(
            "Staff",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          leadingWidth: 10,
          leading: const SizedBox.shrink(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TabBarView(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * .05),
                    child: MyActionChip(
                      categories: categories,
                      onPressed: selectCategories,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        boxShadow: <BoxShadow>[
                          CustomShadow.shadow,
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Image(
                                image: AssetImage(AppImages.doctor2),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.45,
                                          child: const Text(
                                            "Dr. Travis Westaby",
                                            style: TextStyle(
                                              fontSize: 19,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        SvgPicture.asset(AppIcons.favorite2),
                                      ],
                                    ),
                                    const Divider(),
                                    const Text(
                                      "Cardiologists",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child:
                                              SvgPicture.asset(AppIcons.star),
                                        ),
                                        const Text("4.8  (4,279 reviews)"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 4; i++) RoundedBox(index: i),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
