import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/utils/context_utils.dart';
import '../../../common/utils/custom_shadow.dart';
import '../../../features/main/doctors_profile/widgets/custom_personal_card.dart';
import '../../../features/main/doctors_profile/widgets/main_text.dart';
import '../../../features/main/help_center/help_center.dart';
import '../../../features/main/home/components/action_chip.dart';
import '../widgets/simple_appbar.dart';

class DoctorWallet extends StatefulWidget {
  const DoctorWallet({super.key});

  @override
  State<DoctorWallet> createState() => _DoctorWalletState();
}

class _DoctorWalletState extends State<DoctorWallet> {
  List<QuestionType> historySort = [
    QuestionType(categoryName: "All"),
    QuestionType(categoryName: "Client"),
    QuestionType(categoryName: "Ads"),
    QuestionType(categoryName: "Withdraw"),
    QuestionType(categoryName: "Top up"),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          size.height * 0.06,
        ),
        child: const SimpleAppBar(
          isBack: true,
          text: "Wallet",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: CustomPersonalCard(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: MainText(
              text: "History",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * .02),
            child: MyActionChip(
              categories: historySort,
              onPressed: (p0) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: SizedBox(
              width: size.width,
              height: size.width * 0.23,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    CustomShadow.shadow,
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Samandar Takhirov",
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "10 minutes",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray,
                            ),
                          ),
                          Text(
                            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}  ${DateTime.now().hour}:${DateTime.now().minute}",
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "+30.000",
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
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
    );
  }
}
