import 'package:flutter/material.dart';

import '../../../../../../common/constants/app_colors.dart';
import '../../../widgets/main_text.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainText(
          text: "Do you have Promo Code",
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextField(
            textInputAction: TextInputAction.done,
            cursorColor: AppColors.mainColor,
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            decoration: InputDecoration(
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
    );
  }
}
