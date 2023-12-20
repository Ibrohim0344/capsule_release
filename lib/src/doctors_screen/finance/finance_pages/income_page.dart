import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_images.dart';
import '../../../common/utils/context_utils.dart';
import '../../../features/main/doctors_profile/widgets/bottom_navigation_button.dart';
import '../../../features/main/doctors_profile/widgets/main_text.dart';
import '../widgets/simple_appbar.dart';
import 'widgets/custom_card.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
// late TextEditingController textEditingController;
  final int capsuleBalance = 500000;
  final int userBalance = 200000;

  // @override
  // void initState() {
  //   textEditingController = TextEditingController();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   textEditingController.dispose();
  //   super.dispose();
  // }

  // void onTap(int customPrice) {
  //   if(capsuleBalance > userBalance && capsuleBalance > customPrice) {
  //     setState(() {
  //       capsuleBalance - customPrice;
  //       userBalance + customPrice;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // int number = int.parse(textEditingController.text.trim());
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Top Up to Capsule Card",
        // onTap: () => onTap(number),
        onTap: () {},
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          size.height * 0.06,
        ),
        child: const SimpleAppBar(
          text: "Income",
          isBack: true,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  CustomCard(
                    logoPath: AppImages.imgUzum,
                    size: size,
                    cardName: "Capsule Card",
                    userName: "Samandar Takhirov",
                    balance: capsuleBalance,
                  ),
                  ExpansionTile(
                    tilePadding: const EdgeInsets.all(0),
                    trailing: const SizedBox.shrink(),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    title: CustomCard(
                      logoPath: AppImages.imgClick,
                      size: size,
                      cardName: "UzCard",
                      userName: "Samandar Takhirov",
                      balance: userBalance,
                    ),
                    children: [
                      CustomCard(
                        logoPath: AppImages.imgPayme,
                        size: size,
                        cardName: "Humo",
                        userName: "Samandar Takhirov",
                        balance: 25000,
                      ),
                      CustomCard(
                        logoPath: AppImages.cardFrame,
                        size: size,
                        cardName: "",
                        userName: "Add New Card",
                        balance: 25000,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 30,
                top: 75,
                child: SizedBox.fromSize(
                  size: Size(
                    size.width * 0.15,
                    size.width * 0.15,
                  ),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.up_arrow,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: MainText(text: "How much"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: SizedBox(
              height: 60,
              child: TextField(
                // controller: textEditingController,
                textInputAction: TextInputAction.done,
                cursorColor: AppColors.mainColor,
                keyboardType: TextInputType.number,
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                      width: 2,
                    ),
                  ),
                  // focusColor: AppColors.mainColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
