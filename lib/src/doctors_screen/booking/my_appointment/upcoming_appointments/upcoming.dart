import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/details_page.dart';
import '../components/empty_section.dart';
import '../model/doctor_appointment_model.dart';
import '../model/doctor_card.dart';

class Upcoming extends StatelessWidget {
  Upcoming({super.key});

  final List<DoctorAppointment> upcomingList = [
    DoctorAppointment(
      doctorName: "Dr. Drake Boeson",
      contactType: "Messaging",
      status: "Upcoming",
      date: DateTime(2022, 05, 4, 12, 45),
      doctorImage: Image.asset("assets/images/doctor2.png"),
      contactImage: SvgPicture.asset("assets/icons/chat.svg"),
      location: "The Valley Hospital in California, US",
      type: "Immunologists",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool isEmpty = upcomingList.isNotEmpty;
    return isEmpty
        ? ListView.builder(
            itemCount: upcomingList.length,
            itemBuilder: (context, index) {
              final appointment = upcomingList[index];
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
                      appointment: appointment, onReviewPressed: null),
                ),
              );
            },
          )
        : const EmptySection();
  }
}
