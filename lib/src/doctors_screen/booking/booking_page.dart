import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../../common/utils/context_utils.dart';
import '../team/widgets/department_widgets.dart';
import 'book_doctor/book_doctor.dart';
import 'booking_history/booking_history.dart';
import 'client/client_profile.dart';
import 'favorite_doctors/favorite_doctors.dart';
import 'my_appointment/my_appointment.dart';
import 'widgets/custom_clents_card.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> financeIcons = [
    AppIcons.icComment,
    AppIcons.appointments,
    AppIcons.historyActive,
    AppIcons.favorite,
  ];

  List<String> financeTitles = [
    "Booking other doctors",
    "My Appointment",
    "History your booking",
    "Your favorite doctors",
  ];

  List<Widget> navigators = [
    const BookDoctor(),
    const MyAppointments(),
    const BookingHistory(),
    const FavoriteDoctor(),
  ];

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
            ),
          ],
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          title: const Text(
            "Booking",
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
                text: "Work",
              ),
              Tab(
                text: "Other Doctors",
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
                  Column(
                    children: List.generate(
                      20,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * .04,
                          vertical: size.height * .008,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ClientProfile(),
                              ),
                            );
                          },
                          child: CustomClientsCard(
                            isActive: index.isEven ? true : false,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => DepartmentWidgets(
                  isTrialing: false,
                  iconPath: financeIcons[index],
                  title: financeTitles[index],
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => navigators[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
