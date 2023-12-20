import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import '../finance/widgets/usefulbutton.dart';
import 'sales_pages/ads_manager_page.dart';
import 'sales_pages/daily_discount_page.dart';
import 'sales_pages/doctors_price_page.dart';
import 'sales_pages/promocode_page.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<String> salesIcons = [
    AppIcons.icPromocode,
    AppIcons.icPrice,
    AppIcons.icDiscount,
    AppIcons.icAdsManager,
  ];

  List<String> salesTitles = [
    "PromoCode",
    "Doctor’s price",
    "Daily Discount",
    "Ads Manager",
  ];

  List<Widget> pages = const [
    PromoCodePage(),
    DoctorsPricePage(),
    DailyDiscountPage(),
    AdsManager(),
  ];

  void openPage(BuildContext context, Widget screen) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: const Text(
          "Sales",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        leadingWidth: 10,
        leading: const SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => UsefulButton(
            iconPath: salesIcons[index],
            title: salesTitles[index],
            onTap: () => openPage(
              context,
              pages[index],
            ),
          ),
        ),
      ),
    );
  }
}
