import 'package:flutter/material.dart';

class DoctorType {
  final String categoryName;
  bool isSelected;

  DoctorType({
    required this.categoryName,
    this.isSelected = false,
  });
}

class HomeProvider extends ChangeNotifier {
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
    notifyListeners();
  }
}
