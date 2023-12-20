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
import '../payment_methods_page/methods_page/methods_page.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({super.key});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  void back() => Navigator.pop(context);
  bool isSelect = false;
  bool isSelectAge = false;
  int selectAge = 0;
  List<String> selectedValue = ["Male", "Female"];
  String selectedOneValue = "";

  @override
  void initState() {
    selectedOneValue = selectedValue.first;
    super.initState();
  }

  void openAppointmentPage() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppointmentPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Next",
        onTap: openAppointmentPage,
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.08,
        ),
        child: DoctorsAppBar(
          title: "Patient Details",
          backTap: back,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainText(
                text: "Full Name",
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: TextField(
                  textInputAction: TextInputAction.done,
                  cursorColor: AppColors.mainColor,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "Andrew Ainsley",
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
              const SizedBox(height: 10),
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
                  tilePadding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8,
                  ),
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  title: Text(
                    selectedOneValue,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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
                  children: [
                    SizedBox(
                      height: 75,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(
                          initialItem:
                              selectedOneValue.contains("Male") ? 0 : 1,
                        ),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            selectedOneValue = selectedValue[value];
                          });
                        },
                        children: List.generate(
                          selectedValue.length,
                          (index) {
                            return Text(
                              selectedValue[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const MainText(
                text: "Your Age",
              ),
              const SizedBox(height: 10),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    CustomShadow.shadow,
                  ],
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
                    "$selectAge",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      isSelectAge = !isSelectAge;
                    });
                  },
                  trailing: Transform.rotate(
                    angle: isSelectAge ? 0 : 3.15,
                    child: SvgPicture.asset(
                      AppIcons.icDown,
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 75,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(
                          initialItem: selectAge,
                        ),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            selectAge = value;
                          });
                        },
                        children: List.generate(
                          120,
                          (index) {
                            return Text(
                              "$index",
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const MainText(
                text: "Write Your Problem",
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: size.height * 0.2,
                child: TextField(
                  textInputAction: TextInputAction.newline,
                  cursorColor: AppColors.mainColor,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  maxLines: 10,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "Your Problem",
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
            ],
          ),
        ),
      ),
    );
  }
}
