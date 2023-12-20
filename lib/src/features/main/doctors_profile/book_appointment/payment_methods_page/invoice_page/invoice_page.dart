import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/constants/app_colors.dart';
import '../../../../../../common/constants/app_images.dart';
import '../../../../../../common/utils/context_utils.dart';
import '../../../../../../common/utils/custom_shadow.dart';
import '../../../../main_page.dart';
import '../../../widgets/bottom_navigation_button.dart';
import '../../../widgets/doctors_about_card.dart';
import '../../../widgets/doctors_app_bar.dart';
import 'widgets/dialoog_button.dart';
import 'widgets/invoice_check.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  void back() => Navigator.pop(context);

  Future<void> _showSubmitDialog(Size size) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: const Color(0xffffffff),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SvgPicture.asset("assets/images/success.svg"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(height: size.height * 0.01),
                Text(
                  "Congratulations!",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  "Appointment successfully booked. You will receive a notification and the doctor you selected will contact you.",
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            DialogButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
              text: "View Appointment",
            ),
            const SizedBox(height: 10),
            DialogButton(
              buttonIsFill: false,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InvoicePage()));
              },
              text: "Cancel",
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Next",
        onTap: () => _showSubmitDialog(size),
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.23,
        ),
        child: DoctorsAppBar(
          title: "Review Summary",
          backTap: back,
          bottom: const PreferredSize(
            preferredSize: Size(0, 0),
            child: ColoredBox(
              color: AppColors.white,
              child: Column(
                children: [
                  DoctorsAboutCard(
                    isActive: true,
                    doctorName: "Dr. Jenny Watson",
                    doctorProfession: "Immunologists",
                    profileImage: "assets/images/doctors_profile_img.png",
                    workPlace: "Christ Hospital in London, UK",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: InvoiceCheck(
                sizeHeight: 154,
                mainOne: "Dec 23, 2024 | 10:00 AM",
                mainThree: "30 minutes",
                mainTwo: "Messaging",
                textOne: "Date & Hour",
                textThree: "Duration",
                textTwo: "Package",
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: InvoiceCheck(
                sizeHeight: 174,
                isDivider: true,
                mainOne: r"$20",
                mainThree: r"$20",
                mainTwo: r"1 x $20",
                textOne: "Amount",
                textThree: "Total",
                textTwo: "Duration (30 mins)",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: SizedBox(
                height: 80,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [CustomShadow.shadow],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 42,
                              height: 42,
                              child: Image(
                                image: AssetImage(
                                  AppImages.imgUzum,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Capsule Card",
                              style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "•••• •••• ••10 0510",
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
