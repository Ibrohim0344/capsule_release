import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/custom_search_field.dart';
import '../home/components/action_chip.dart';
import 'components/contact_button.dart';
import 'components/custom_expansion_tile.dart';
import 'mixin/help_center_mixin.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> with HelpCenterMixin {
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
              Tab(text: "FAQ"),
              Tab(text: "Contact us"),
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
                    child: MyActionChip(categories: categories),
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
