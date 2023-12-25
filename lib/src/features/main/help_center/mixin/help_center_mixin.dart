import 'package:flutter/material.dart';

import '../../../../common/constants/app_icons.dart';
import '../../../../common/utils/category_models.dart';
import '../customer_service/customer_service_screen.dart';
import '../help_center.dart';



mixin HelpCenterMixin on State<HelpCenterPage> {
  List<QuestionType> categories = [
    QuestionType(categoryName: "General"),
    QuestionType(categoryName: "Account"),
    QuestionType(categoryName: "Service"),
    QuestionType(categoryName: "Payment"),
  ];

  List<String> contactIcons = [
    AppIcons.service,
    AppIcons.whatsapp,
    AppIcons.website,
    AppIcons.facebook,
    AppIcons.twitter,
    AppIcons.instagram,
  ];

  List<String> contactTitles = [
    "Customer Service",
    "WhatsApp",
    "Website",
    "Facebook",
    "Twitter",
    "Instagram",
  ];

  List<String> questions = [
    "What is Capsule?",
    "How to use Capsule?",
    "How do I cancel an appointment?",
    "How do I save the recording?",
    "How do I exit the app?",
  ];

  List<String> answers = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  ];

  void onTap() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CustomerServiceScreen(chatPath: ''),
        ),
      );

  @override
  void initState() {
    categories[0].isSelected = true;
    super.initState();
  }
}
