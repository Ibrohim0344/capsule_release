import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/details_page.dart';
import '../model/doctor_appointment_model.dart';
import '../model/doctor_card.dart';
import '../components/empty_section.dart';

class Cancelled extends StatelessWidget {
  Cancelled({super.key});

  final List<DoctorAppointment> canceledAppointments = [
    DoctorAppointment(
      doctorName: "Dr. Raul Zirkind",
      contactType: "Voice call",
      status: "Cancelled",
      date: DateTime(2022, 12, 12, 16, 00),
      doctorImage: Image.asset("assets/images/doctor1.png"),
      contactImage: SvgPicture.asset("assets/icons/call.svg"),
      location: "The Valley Hospital in California, US",
      type: "Immunologists",
    ),
    DoctorAppointment(
      doctorName: "Dr. Keegan Dach",
      contactType: "Messaging",
      status: "Cancelled",
      date: DateTime(2022, 11, 20, 10, 00),
      doctorImage: Image.asset("assets/images/doctor6.png"),
      contactImage: SvgPicture.asset("assets/icons/chat.svg"),
      location: "Christ Hospital in London, UK",
      type: "Immunologists",
    ),
    DoctorAppointment(
      doctorName: "Dr. Drake Boeson",
      contactType: "Video call",
      status: "Cancelled",
      date: DateTime(2022, 11, 08, 13, 00),
      doctorImage: Image.asset("assets/images/doctor2.png"),
      contactImage: SvgPicture.asset("assets/icons/video.svg"),
      location: "The Valley Hospital in California, US",
      type: "Immunologists",
    ),
    DoctorAppointment(
      doctorName: "Dr. Quinn Slatter",
      contactType: "Voice call",
      status: "Cancelled",
      date: DateTime(2022, 10, 16, 09, 00),
      doctorImage: Image.asset("assets/images/doctor3.png"),
      contactImage: SvgPicture.asset("assets/icons/call.svg"),
      location: "Christ Hospital in London, UK",
      type: "Immunologists",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isEmpty = canceledAppointments.isNotEmpty;
    return isEmpty
        ? ListView.builder(
      itemCount: canceledAppointments.length,
      itemBuilder: (context, index) {
        final appointment = canceledAppointments[index];
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
            child: DoctorCard(appointment: appointment, onReviewPressed: null),
          ),
        );
      },
    )
        : const EmptySection();
  }
}
