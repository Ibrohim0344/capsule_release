import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_images.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../../common/utils/custom_shadow.dart';
import 'widget/voiceCall.dart';

class VoiceCallPage extends StatefulWidget {
  const VoiceCallPage({super.key});

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

final List<String> callD = [
  "Today | 14:00 PM",
  "Yesterday | 19:00 PM",
  "Dec 10.2023 | 10:30 AM",
  "Dec 05.2023 | 15:00 PM",
  "Today | 14:00 PM",
  "Yesterday | 19:00 PM",
  "Dec 10.2023 | 10:30 AM",
  "Dec 05.2023 | 15:00 PM",
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

final List<String> voiceDname = [
  "Dr. Jenny Watson",
  "Dr. Dustin Jurries",
  "Dr. Aidan Allende",
  "Dr. Raul Zirkind",
  "Dr. Jenny Watson",
  "Dr. Dustin Jurries",
  "Dr. Aidan Allende",
  "Dr. Raul Zirkind",
];

final List<String> voiceCall = [
  AppImages.voiceCall1,
  AppImages.voiceCall2,
  AppImages.voiceCall3,
  AppImages.voiceCall4,
  AppImages.voiceCall5,
  AppImages.voiceCall6,
  AppImages.voiceCall7,
  AppImages.voiceCall8,
];

class _VoiceCallPageState extends State<VoiceCallPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: voiceCall.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CallVoiceDoctor(
                          callD: callD[index],
                          subtitle: subtitle[index],
                          voiceDname: voiceDname[index],
                          voiceCall: voiceCall[index],
                        )));
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
                      image: AssetImage(voiceCall[index]),
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
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              voiceDname[index],
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
                            callD[index],
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
