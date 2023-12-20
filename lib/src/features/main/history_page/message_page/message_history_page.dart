import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/app_icons.dart';
import '../../../../common/constants/app_images.dart';
import '../../../../common/utils/context_utils.dart';
import '../video_page/video_call_page.dart';
import '../voice_page/voice_call_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

final List<String> hour = [
  "10.00 AM",
  "18.00 PM",
  "10.30 AM",
  "17.00 PM",
  "09.30 AM",
  "10.00 AM",
  "15.30 PM",
  "10.00 AM",
  "10.00 AM",
  "18.00 PM",
  "10.30 AM",
  "17.00 PM",
  "09.30 AM",
  "10.00 AM",
  "15.30 PM",
  "10.00 AM",
];

final List<String> month = [
  "Today",
  "Yesterday",
  "20/12/2022",
  "14/12/2022",
  "26/11/2022",
  "09/11/2022",
  "18/10/2022",
  "07/10/2022",
  "Today",
  "Yesterday",
  "20/12/2022",
  "14/12/2022",
  "26/11/2022",
  "09/11/2022",
  "18/10/2022",
  "07/10/2022",
];

final List<String> title = [
  "My Pleasure. All the best for..",
  "Your solution is great!",
  "Thanks for the help doctor",
  "I have recovered, thank you v...",
  "I went there yesterday",
  "IDK what else is there to do...",
  "I advise you to take a break",
  "Your solution is great",
  "My Pleasure. All the best for..",
  "Your solution is great!",
  "Thanks for the help doctor",
  "I have recovered, thank you v...",
  "I went there yesterday",
  "IDK what else is there to do...",
  "I advise you to take a break",
  "Your solution is great"
];

final historyDoctor = [
  AppImages.historyImages1,
  AppImages.historyImages2,
  AppImages.historyImages3,
  AppImages.historyImages4,
  AppImages.historyImages5,
  AppImages.historyImages6,
  AppImages.historyImages7,
  AppImages.historyImages8,
  AppImages.historyImages9,
  AppImages.historyImages10,
  AppImages.historyImages11,
  AppImages.historyImages12,
  AppImages.historyImages13,
  AppImages.historyImages14,
  AppImages.historyImages15,
  AppImages.historyImages16,
];

final List<String> dName = [
  "Dr. Drake Boeson",
  "Dr. Aidan Allende",
  "Dr. Salvatore Heredia",
  "Dr. Delaney Mangino",
  "Dr. Beckett Calger",
  "Dr. Bernard Bliss",
  "Dr. Jada Srnsky",
  "Dr. Randy Wigham",
  "Dr. Drake Boeson",
  "Dr. Aidan Allende",
  "Dr. Salvatore Hered",
  "Dr. Delaney Mangino",
  "Dr. Beckett Calger",
  "Dr. Bernard Bliss",
  "Dr. Jada Srnsky",
  "Dr. Randy Wigham",
];

void searchIcons() {}

void icons() {}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leadingWidth: 10,
          leading: const SizedBox.shrink(),
          // leading: Image(image: AssetImage(AppImages.logoImages), height: 28,width: 28,),
          elevation: 0,
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          toolbarHeight: 60,
          title: const Text(
            "History",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.search,
                color: AppColors.black,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.icMore,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            labelColor: AppColors.blueColor,
            unselectedLabelColor: AppColors.tabBarUnSelected,
            indicatorColor: AppColors.blueColor,
            indicatorWeight: 4,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: const [
              Tab(
                text: "Message",
              ),
              Tab(
                text: "Voice Call",
              ),
              Tab(
                text: "Video Call",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: dName.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () { },
                    leading: Image(
                      image: AssetImage(
                        historyDoctor[index],
                      ),
                      height: 100,
                    ),
                    title: Text(
                      dName[index],
                      style: context.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      title[index],
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          month[index],
                          style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey),
                        ),
                        Text(
                          hour[index],
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                        )
                      ],
                    ),
                  );
                }),
            const VoiceCallPage(),
            const VideCallPage(),
          ],
        ),
      ),
    );
  }
}
