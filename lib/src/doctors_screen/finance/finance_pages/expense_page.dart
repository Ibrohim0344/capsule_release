import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import '../../../features/main/doctors_profile/widgets/bottom_navigation_button.dart';
import '../widgets/simple_appbar.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationButton(
        text: "Coming soon",
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
          text: "Expense",
          isBack: true,
        ),
      ),
    );
  }
}
