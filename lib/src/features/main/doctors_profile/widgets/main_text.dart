import 'package:flutter/material.dart';

import '../../../../common/utils/context_utils.dart';

class MainText extends StatelessWidget {
  final String text;

  const MainText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
