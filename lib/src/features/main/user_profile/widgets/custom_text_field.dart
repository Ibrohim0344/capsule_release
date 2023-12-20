import 'package:flutter/material.dart';

import '../../../../common/utils/context_utils.dart';
import '../../../../common/utils/custom_shadow.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.onSubmitted,
    this.textInputAction,
    this.readOnly=false,
    this.onTap,
    this.keyboardType,
    super.key,
  });

  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final TextInputType? keyboardType;

  final void Function(String)? onSubmitted;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          CustomShadow.shadow,
        ],
      ),
      child: TextField(
        onTap: onTap,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onSubmitted: onSubmitted,
        controller: controller,
        style: context.textTheme.titleMedium?.copyWith(
          color: const Color(0xFF212121),
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color(0xFFFAFAFA),
          hintText: hintText,
          hintStyle: context.textTheme.titleMedium?.copyWith(
            color: const Color(0xFF212121),
            fontWeight: FontWeight.w600,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
        ),

        textInputAction: textInputAction,
      ),
    );
  }
}
