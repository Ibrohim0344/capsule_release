import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_images.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../../common/utils/custom_shadow.dart';
import '../../../../features/main/history_page/video_page/widget/call_doctor.dart';

class VoiceCall extends StatefulWidget {
  const VoiceCall({super.key});

  @override
  State<VoiceCall> createState() => _VoiceCallState();
}

final List<String> videoDocName = [
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

class _VoiceCallState extends State<VoiceCall> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallVideoDoctor(
                videoDname: videoDocName[index],
                subtitle: subtitle[index],
                time: time[index],
                image: dImages[index],
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [CustomShadow.shadow],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(dImages[index]),
                        height: 110,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                videoDocName[index],
                                style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.black,
                                  overflow: TextOverflow.ellipsis,
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
                      Image(
                        image: AssetImage(AppImages.voiceIcon),
                        height: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
