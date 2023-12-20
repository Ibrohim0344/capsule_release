import 'package:flutter/material.dart';

import '../../../../common/utils/context_utils.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
    this.subtitle,
    this.titleSize,
    super.key,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final double? titleSize;
  final void Function()? onTap;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ListTile(
        title: Text(
          widget.title,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
        leading: widget.leading,
        trailing: widget.trailing,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
