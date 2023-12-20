import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/utils/custom_search_field.dart';
import '../home/components/action_chip.dart';
import 'components/contact_button.dart';
import 'components/custom_expansion_tile.dart';
import 'customer_service/customer_service_screen.dart';

class QuestionType {
  final String categoryName;
  bool isSelected;

  QuestionType({
    required this.categoryName,
    this.isSelected = false,
  });
}

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
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

  void onTap() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CustomerServiceScreen(
            chatPath: '',
          ),
        ),
      );

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
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          leading: const BackButton(),
          title: const Text(
            "Help Center",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.blue,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            labelStyle: const TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
              fontFamily: "Urbanist",
              letterSpacing: 1,
            ),
            unselectedLabelColor: AppColors.lightGray,
            tabs: const [
              Tab(
                text: "FAQ",
              ),
              Tab(
                text: "Contact us",
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .038,
                      vertical: 12,
                    ),
                    child: const CustomSearchField(),
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) => CustomExpansionTile(
                        question: questions[index],
                        answer: answers[0],
                        onExpansionChanged: (bool s) {},
                        isCollapsed: true,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => ContactButton(
                  iconPath: contactIcons[index],
                  title: contactTitles[index],
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
