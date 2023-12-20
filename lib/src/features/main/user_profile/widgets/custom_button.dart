import 'package:flutter/material.dart';

import '../../../../common/utils/context_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.text,
    this.size,
    this.color = Colors.cyanAccent,
    this.textColor = Colors.white,
    this.elevation,
    this.side,
    this.fontSize,
    required this.onPressed,
    super.key,
  });

  final String? text;
  final Size? size;
  final Color color;
  final Color textColor;
  final double? elevation;
  final BorderSide? side;
  final double? fontSize;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(elevation),
        shadowColor: MaterialStateProperty.all(Colors.blue),
        side: MaterialStateProperty.all(side),
      ),
      child: text != null
          ? Text(
              text!,
              style: context.textTheme.titleMedium?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w800,
                fontSize: fontSize,
              ),
            )
          : null,
    );
  }
}
