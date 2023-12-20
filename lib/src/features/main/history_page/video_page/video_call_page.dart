import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_images.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../../common/utils/custom_shadow.dart';
import 'widget/call_doctor.dart';

class VideCallPage extends StatefulWidget {
  const VideCallPage({super.key});

  @override
  State<VideCallPage> createState() => _VideCallPageState();
}

final List<String> videoDname = [
  "Dr. Maria Foose",
  "Dr. Bernad Bliss",
  "Dr. Quinn Slatter",
  "Dr. Jada Srnsky",
  "Dr. Maria Foose",
  "Dr. Bernad Bliss",
  "Dr. Quinn Slatter",
  "Dr. Jada Srnsky",
];

final List<String> subtitle = [
  "Voice Call",
  "Voice Call",
  "Voice Call",
  "Voice Call",
  "Voice Call",
  "Voice Call",
  "Voice Call",
  "Voice Call",
];

final List<String> time = [
  "Today | 16:00 PM",
  "Dec 16.2023 | 09:00 AM",
  "Nov 27.2023 | 16:30 PM",
  "Nov 27.2023 | 16:30 PM",
  "Today  | 16:00 PM",
  "Dec 16.2023 | 09:00 AM",
  "Nov 27.2023 | 16:30 PM",
  "Nov 27.2023 | 16:30 PM",
];

final List<String> dImages = [
  AppImages.videoCall1,
  AppImages.videoCall2,
  AppImages.videoCall3,
  AppImages.videoCall4,
  AppImages.videoCall5,
  AppImages.videoCall6,
  AppImages.videoCall7,
  AppImages.videoCall8,
];

class _VideCallPageState extends State<VideCallPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CallVideoDoctor(
                  videoDname: videoDname[index],
                  subtitle: subtitle[index],
                  time: time[index],
                  image: dImages[index],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [
                  CustomShadow.shadow,
                ],
              ),
              child: SizedBox(
                height: 142,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 10),
                    Image(
                      image: AssetImage(dImages[index]),
                      height: 110,
                    ),
                    //const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              videoDname[index],
                              style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.black
                              ),
                            ),
                          ),
                          Text(
                            subtitle[index],
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            time[index],
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
                        image: AssetImage(AppImages.voiceIcon),
                        height: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
