import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_icons.dart';
import '../../../../../common/utils/context_utils.dart';
import '../../../../../common/utils/custom_shadow.dart';
import '../../widgets/bottom_navigation_button.dart';
import '../../widgets/doctors_app_bar.dart';
import '../../widgets/main_text.dart';
import '../patient_details/patient_details.dart';
import 'widgets/promocode.dart';
import 'widgets/select_package.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  bool isSelect = false;
  int selectedValue = 5;

  void back() => Navigator.pop(context);

  void openPatientDetails() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PatientDetails(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Next",
        onTap: openPatientDetails,
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.08,
        ),
        child: DoctorsAppBar(
          title: "Select Package",
          backTap: back,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainText(
                text: "Select Duration",
              ),
              const SizedBox(height: 10),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [CustomShadow.shadow],
                ),
                child: ExpansionTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8,
                  ),
                  title: Text(
                    "$selectedValue minutes",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      isSelect = !isSelect;
                    });
                  },
                  trailing: Transform.rotate(
                    angle: isSelect ? 0 : 3.15,
                    child: SvgPicture.asset(
                      AppIcons.icDown,
                    ),
                  ),
                  leading: SvgPicture.asset(
                    AppIcons.icTime,
                  ),
                  children: [
                    SizedBox(
                      height: 100,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            selectedValue = (value + 1) * 5;
                          });
                        },
                        children: List.generate(
                          12,
                          (index) => Text(
                            "${(index + 1) * 5}",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const MainText(text: "Select Package"),
              const SizedBox(height: 10),
              SelectPackage(
                price: 5000 * selectedValue.toDouble() * 0.9,
                packageText: "One-time purchase",
                infoText: "Chat messages with doctor",
                minutes: selectedValue,
                oldPrice: 5000 * selectedValue.toDouble(),
              ),
              const SizedBox(height: 20),
              const SelectPackage(
                packageText: "Subscription",
                infoText: "Chat messages with doctor",
              ),
              const SizedBox(height: 20),
              const PromoCode(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
