import 'package:flutter/material.dart';

import '../../../common/constants/app_colors.dart';
import 'message/message.dart';
import 'video_call/video_call.dart';
import 'voice_call/voice_call.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          leading: const BackButton(),
          title: const Text(
            "Booking History",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            indicatorColor: AppColors.blue,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: size.width * .03),
            labelStyle: const TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
              fontFamily: "Urbanist",
              letterSpacing: 1,
            ),
            unselectedLabelColor: AppColors.lightGray,
            tabs: const [
              Tab(
                text: "Message",
              ),
              Tab(
                text: "Video Call",
              ),
              Tab(
                text: "Voice Call",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Message(),
            VideoCall(),
            VoiceCall(),
          ],
        ),
      ),
    );
  }
}
