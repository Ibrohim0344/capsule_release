import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final void Function(bool) onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeTrackColor: AppColors.mainColor,
      value: widget.value,
      activeColor: AppColors.mainColor,
      inactiveThumbColor: const Color(0xFFEEEEEE),
      inactiveTrackColor: const Color(0xFFEEEEEE),
      trackOutlineColor: MaterialStateProperty.all(Colors.white),
      trackOutlineWidth: MaterialStateProperty.all(2),
      splashRadius: 1,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
      onChanged: widget.onChanged,
    );
  }
}
