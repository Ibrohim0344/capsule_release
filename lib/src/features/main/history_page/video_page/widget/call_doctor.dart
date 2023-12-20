import 'package:flutter/material.dart';

import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_images.dart';
import '../../../../../common/utils/context_utils.dart';

class CallVideoDoctor extends StatefulWidget {
  const CallVideoDoctor({
    super.key,
    required this.videoDname,
    required this.subtitle,
    required this.image,
    required this.time,
  });

  final String videoDname;
  final String subtitle;
  final String time;
  final String image;

  @override
  State<CallVideoDoctor> createState() => _CallVideoDoctorState();
}

class _CallVideoDoctorState extends State<CallVideoDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColors.black1Color,
        backgroundColor: AppColors.whiteColor,
        title:  Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.70),
          child: GestureDetector(
            onTap: () {},
            child: const Image(
              image: AssetImage("assets/images/iconImages.png"),
              height: 25,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              height: 150,
              child: Card(
                elevation: 0,
                color: AppColors.whiteColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 10),
                    Image(
                      image: AssetImage(widget.image),
                      height: 110,
                    ),
                    //const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.videoDname,
                            style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.black
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            widget.time,
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image(
                        image: AssetImage(AppImages.videoIcon),
                        height: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 10),
            Text(
            "30 minutes of video calls have been recorded.",
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.grey,
              ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              double buttonWidth = constraints.maxWidth * 0.9;
              double iconSize = buttonWidth * 0.15;
              return SizedBox(
                height: 60,
                width: buttonWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(width: iconSize),
                      const Icon(
                        Icons.play_circle,
                        color: AppColors.whiteColor,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                       Text(
                        "Play Audio Recordings",
                        style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.whiteColor
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
