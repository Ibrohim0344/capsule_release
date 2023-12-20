import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../common/utils/context_utils.dart';

class Reviews extends StatefulWidget {
  final String profileImage;
  final String userName;
  final String comment;
  final int commentCreatedAt;
  final int likeCount;
  final int commentLikeCount;

  const Reviews({
    required this.commentCreatedAt,
    required this.commentLikeCount,
    required this.comment,
    required this.likeCount,
    required this.userName,
    required this.profileImage,
    super.key,
  });

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: Image.asset(
                      widget.profileImage,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  widget.userName,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    maximumSize: const Size(55, 28),
                    minimumSize: const Size(55, 28),
                    padding: const EdgeInsets.all(0),
                    side: const BorderSide(
                      color: AppColors.mainColor,
                      width: 2,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        AppIcons.icStar,
                      ),
                      widget.likeCount != 0
                          ? Text(
                              "${widget.likeCount}",
                              style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.mainColor,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )

                // IconButton(
                //   icon: SvgPicture.asset(
                //     "assets/images/ic_more.svg",
                //     width: 28,
                //     height: 28,
                //   ),
                //   onPressed: () {},
                // ),
              ],
            )
          ],
        ),
        const SizedBox(height: 3),
        ReadMoreText(
          widget.comment,
          trimLines: 2,
          colorClickableText: Colors.pink,
          trimMode: TrimMode.Line,
          trimCollapsedText: " view more",
          trimExpandedText: " show less",
          moreStyle: const TextStyle(
            color: AppColors.mainColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                IconButton(
                  style: FilledButton.styleFrom(
                    elevation: 10,
                    visualDensity: VisualDensity.comfortable,
                  ),
                  // splashRadius: 1,
                  icon: SvgPicture.asset(
                    AppIcons.icLike,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "${widget.commentLikeCount}",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            widget.commentCreatedAt != 0
                ? Text(
                    "${widget.commentCreatedAt} days ago",
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
