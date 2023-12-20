import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_icons.dart';
import 'finance_pages/analytics_page.dart';
import 'finance_pages/doctor_wallet.dart';
import 'finance_pages/expense_page.dart';
import 'finance_pages/income_page.dart';
import 'finance_pages/withdraw_money.dart';
import 'widgets/simple_appbar.dart';
import 'widgets/usefulbutton.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  List<String> financeIcons = [
    AppIcons.icWalletPNG,
    AppIcons.icIncome,
    AppIcons.icHistoryPNG,
    AppIcons.icWithDraw,
    AppIcons.icAnalytics,
  ];

  List<String> financeTitles = [
    "Wallet",
    "Income",
    "Expense",
    "Withdraw money",
    "Analytics",
  ];

  List<Widget> pages = const [
    DoctorWallet(),
    IncomePage(),
    ExpensePage(),
    WithDrawMoney(),
    AnalyticsPage(),
  ];

  void openPage(BuildContext context, Widget screen) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
      );

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
          text: "Finance",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => UsefulButton(
            iconPath: financeIcons[index],
            title: financeTitles[index],
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
