import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/details_page.dart';
import '../model/doctor_appointment_model.dart';
import '../model/doctor_card.dart';
import '../components/empty_section.dart';
import '../components/review.dart';

class Completed extends StatelessWidget {
  Completed({super.key});

  final List<DoctorAppointment> completedList = [
    DoctorAppointment(
      doctorName: "Dr. Aidan Allende",
      contactType: "Video call",
      status: "Completed",
      date: DateTime(2022, 12, 14, 15, 00),
      doctorImage: Image.asset("assets/images/doctor7.png"),
      contactImage: SvgPicture.asset("assets/icons/video.svg"),
      location: "The Valley Hospital in California, US",
      type: "Immunologists",
    ),
    DoctorAppointment(
      doctorName: "Dr. Iker Holl",
      contactType: "Messaging",
      status: "Completed",
      date: DateTime(2022, 11, 22, 09, 00),
      doctorImage: Image.asset("assets/images/doctor4.png"),
      contactImage: SvgPicture.asset("assets/icons/chat.svg"),
      location: "Christ Hospital in London, UK",
      type: "Immunologists",
    ),
    DoctorAppointment(
      doctorName: "Dr. Jada Srnsky",
      contactType: "Voice call",
      status: "Completed",
      date: DateTime(2022, 11, 06, 18, 00),
      doctorImage: Image.asset("assets/images/doctor5.png"),
      contactImage: SvgPicture.asset("assets/icons/call.svg"),
      location: "The Valley Hospital in California, US",
      type: "Immunologists",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isEmpty = completedList.isNotEmpty;
    return isEmpty
        ? ListView.builder(
            itemCount: completedList.length,
            itemBuilder: (context, index) {
              final appointment = completedList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(appointment: appointment),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: DoctorCard(
                      appointment: appointment,
                      onReviewPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Review(appointment: appointment,)));
                      }),
                ),
              );
            },
          )
        : const EmptySection();
  }
}
