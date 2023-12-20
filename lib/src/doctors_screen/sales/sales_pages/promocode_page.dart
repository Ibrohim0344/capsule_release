import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import '../../../common/utils/context_utils.dart';
import '../../../common/utils/custom_shadow.dart';
import '../../../features/main/doctors_profile/widgets/bottom_navigation_button.dart';
import '../../finance/widgets/simple_appbar.dart';

class PromoCodePage extends StatefulWidget {
  const PromoCodePage({super.key});

  @override
  State<PromoCodePage> createState() => _PromoCodePageState();
}

class _PromoCodePageState extends State<PromoCodePage> {
  int selectedValue = 1;

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Activate PromoCode",
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
          text: "PromoCode",
          isBack: true,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: SizedBox(
              height: 80,
              child: TextField(
                // controller: textEditingController,
                textInputAction: TextInputAction.done,
                cursorColor: AppColors.mainColor,
                keyboardType: TextInputType.text,
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                maxLength: 10,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Write your PromoCode",
                  hintStyle: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.mainColor,
                      width: 2,
                    ),
                  ),
                  // focusColor: AppColors.mainColor,
                  border: const OutlineInputBorder(
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: DecoratedBox(
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
                  "$selectedValue.10.2024 Enter day",
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
                          selectedValue = value + 1;
                        });
                      },
                      children: List.generate(
                        30,
                        (index) => Text(
                          "${index + 1}",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: DecoratedBox(
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
                  "$selectedValue.10.2024 End day",
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
                          selectedValue = value + 1;
                        });
                      },
                      children: List.generate(
                        30,
                        (index) => Text(
                          "${index + 1}",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
