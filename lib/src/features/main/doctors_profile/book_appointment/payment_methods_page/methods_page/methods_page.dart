import 'package:flutter/material.dart';

import '../../../../../../common/constants/app_colors.dart';
import '../../../../../../common/constants/app_images.dart';
import '../../../widgets/bottom_navigation_button.dart';
import '../../../widgets/custom_personal_card.dart';
import '../../../widgets/doctors_app_bar.dart';
import '../../../widgets/main_text.dart';
import '../../widgets/selected_card.dart';
import '../invoice_page/invoice_page.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {


  void back() => Navigator.pop(context);

  void openInvoicePage() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const InvoicePage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);



    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Next",
        onTap: openInvoicePage,
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.08,
        ),
        child: DoctorsAppBar(
          title: "Your card",
          backTap: back,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPersonalCard(),
            SizedBox(height: 10),
            MainText(
              text: "Choose payment to your card",
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 260,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectedCard(
                    cardIcon: AppImages.imgUzum,
                    cardName: "UzumBank",
                  ),
                  SelectedCard(
                    cardIcon: AppImages.imgPayme,
                    cardName: "Payme",
                  ),
                  SelectedCard(
                    cardIcon: AppImages.imgClick,
                    cardName: "Click",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
