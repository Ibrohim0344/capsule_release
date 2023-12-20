import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_images.dart';
import '../../../common/services/storage/storage.dart';
import '../doctors_profile/widgets/bottom_navigation_button.dart';
import '../doctors_profile/widgets/custom_personal_card.dart';
import '../doctors_profile/widgets/main_text.dart';
import 'transaction_history/transaction_history.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  @override
  void initState() {
    $currentUser.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Top Up",
        onTap: () => () {},
      ),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leadingWidth: 10,
        leading: const SizedBox.shrink(),
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: AppColors.white,
        title: const Text(
          "Wallet",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomPersonalCard(),
            const SizedBox(height: 10),
            const MainText(
              text: "History",
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const HistoryListTile(
                  mainText: "Payme",
                  price: "25 000",
                  iconPNG: AppImages.imgPayme,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
