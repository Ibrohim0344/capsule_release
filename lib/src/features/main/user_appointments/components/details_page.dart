import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/custom_shadow.dart';
import '../chat_screen/chat_screen.dart';
import '../model/doctor_appointment_model.dart';
import '../model/doctor_card.dart';
import 'expandable_text.dart';

class Details extends StatelessWidget {
  final DoctorAppointment appointment;

  Details({required this.appointment, super.key});

  final List<String> monthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  String formatTime(int value) {
    return value.toString().padLeft(2, "0");
  }

  String dayTime() {
    if (appointment.date.hour > 12) {
      return "PM";
    } else {
      return "AM";
    }
  }

  String contactTypeText() {
    if (appointment.contactType == "Messaging") {
      return "Chat messaging";
    } else if (appointment.contactType == "Video call") {
      return "Video call";
    } else if (appointment.contactType == "Voice call") {
      return "Voice call";
    } else {
      return " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "My Appointment",
          style: TextStyle(
            color: Color(0xFF212121),
            fontSize: 24,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          SvgPicture.asset("assets/images/more.svg"),
          const SizedBox(width: 25),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorCard2(appointment: appointment),
              const SizedBox(height: 10),
              const Text(
                "Scheduled Appointment",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "${monthList[appointment.date.month - 1]} ${appointment.date.day}, ${appointment.date.year}",
                style: const TextStyle(
                  color: Color(0xFF424242),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${formatTime(appointment.date.hour)}:${formatTime(appointment.date.minute)} - ${formatTime(appointment.date.hour)}:${formatTime(appointment.date.minute + 30)} (30 minutes)",
                style: const TextStyle(
                  color: Color(0xFF424242),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Patient Information",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Full Name   : Andrew Ainsley",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Gender       : Male",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Age              : 27",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.20,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Problem      : ",
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.20,
                    ),
                  ),
                  Expanded(
                    child: ExpandableText(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Your Package",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: <BoxShadow>[
                    CustomShadow.shadow,
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color(0x14246BFD),
                    child: appointment.contactImage,
                  ),
                  title: Text(
                    appointment.contactType,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 16,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.20,
                    ),
                  ),
                  subtitle: Text(
                    "${contactTypeText().toString()} with doctor",
                    style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 12,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.20,
                    ),
                  ),
                  trailing: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "\$20",
                        style: TextStyle(
                          color: Color(0xFF246BFD),
                          fontSize: 18,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.20,
                        ),
                      ),
                      Text(
                        "(paid)",
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 10,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shadowColor: AppColors.blue,
                  backgroundColor: const Color(0xFF246BFD),
                  disabledBackgroundColor: Colors.indigoAccent[100],
                ),
                onPressed: appointment.status == "Cancelled" ||
                        appointment.status == "Completed"
                    ? null
                    : () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(),));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appointment.status == "Cancelled" ||
                              appointment.status == "Completed"
                          ? const Text("")
                          : SvgPicture.asset(
                              "${appointment.contactImage.semanticsLabel}",
                            ),
                      appointment.status == "Cancelled" ||
                              appointment.status == "Completed"
                          ? Text(
                              appointment.status,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.20,
                              ),
                            )
                          : Text(
                              " ${appointment.contactType} (Starts at ${formatTime(appointment.date.hour)}:${formatTime(appointment.date.minute)} ${dayTime().toString()})",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.20,
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
