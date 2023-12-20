import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/custom_search_field.dart';
import '../home/components/action_chip.dart';

class DoctorType {
  final String categoryName;
  bool isSelected;

  DoctorType({
    required this.categoryName,
    this.isSelected = false,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<DoctorType> categories = [
    DoctorType(categoryName: "All"),
    DoctorType(categoryName: "General"),
    DoctorType(categoryName: "Dentist"),
    DoctorType(categoryName: "Nutritionist"),
    DoctorType(categoryName: "Ophthalmologist"),
    DoctorType(categoryName: "Neurologist"),
    DoctorType(categoryName: "Pediatric"),
  ];

  void selectCategories(int value) {
    for (int i = 0; i < categories.length; i++) {
      i == value
          ? categories[i].isSelected = true
          : categories[i].isSelected = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        leading: const BackButton(),
        title: const CustomSearchField(),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: MyActionChip(
                categories: categories,
                onPressed: selectCategories,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
