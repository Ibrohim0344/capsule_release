import 'package:flutter/material.dart';

import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/category_models.dart';
import '../../help_center/help_center.dart';
import '../../notifications/notifications_page.dart';
import '../../search_page/search_page.dart';
import '../../top_doctors/top_doctors.dart';
import '../home_page.dart';

mixin HomeMixin on State<HomePage> {
  List<DoctorType> categories = [
    DoctorType(categoryName: "All"),
    DoctorType(categoryName: "General"),
    DoctorType(categoryName: "Dentist"),
    DoctorType(categoryName: "Nutritionist"),
    DoctorType(categoryName: "Ophthalmologist"),
    DoctorType(categoryName: "Neurologist"),
    DoctorType(categoryName: "Pediatric"),
  ];

  int activeIndex = 0;

  void openNotificationPage() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const NotificationPage(),
        ),
      );

  void openSupportPage() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HelpCenterPage(),
        ),
      );

  void openSearchPage() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SearchPage(),
        ),
      );

  void openTopDoctors() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TopDoctors(),
        ),
      );

  @override
  void initState() {
    $currentUser.getUser();
    categories[0].isSelected = true;
    super.initState();
  }
}
