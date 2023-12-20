import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';

sealed class CustomShadow {
  static const shadow = BoxShadow(
    color: AppColors.shadow,
    offset: Offset(0, 1),
    blurRadius: 16,
    spreadRadius: -8,
  );
}
