import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/doctor_appointment_model.dart';
import 'review.dart';

class SessionEnd extends StatelessWidget {
  const SessionEnd({super.key, required this.appointment});

  final DoctorAppointment appointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            SvgPicture.asset(
              "assets/images/session.svg",
            ),
            const SizedBox(height: 10),
            const Text(
              "The consultation session has ended.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF212121),
                fontSize: 20,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Recordings have been saved in activity.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF212121),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.20,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
              child: Divider(
                color: Colors.grey[300],
                height: 3,
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Divider(
                color: Colors.grey[300],
                height: 3,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color(0xffE9F0FF),
                      surfaceTintColor: const Color(0xffE9F0FF),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7, vertical: 18),
                      child: Text(
                        "Back to Home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF246BFD),
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: const Color(0xff246BFD),
                      surfaceTintColor: const Color(0xff246BFD),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Review(appointment: appointment),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7, vertical: 18),
                      child: Text(
                        "Leave a Review",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
