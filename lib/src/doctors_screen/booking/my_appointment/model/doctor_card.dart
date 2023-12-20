import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/utils/custom_shadow.dart';
import '../components/review.dart';
import 'doctor_appointment_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorAppointment appointment;
  final VoidCallback? onReviewPressed;

  DoctorCard({
    required this.appointment,
    super.key,
    required this.onReviewPressed,
  });

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

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (appointment.status == "Cancelled") {
      statusColor = const Color(0xFFF75555);
    } else if (appointment.status == "Completed") {
      statusColor = const Color(0xFF07BD73);
    } else {
      statusColor = const Color(0xFF246BFD);
    }

    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            CustomShadow.shadow,
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Image(image: appointment.doctorImage.image, height: 120, width: 120,),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.doctorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                          fontSize: 18,
                          color: Color(0xFF212121),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "${appointment.contactType} - ",
                              style: const TextStyle(
                                color: Color(0xFF424242),
                                fontSize: 12,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: screenWidth * 0.15,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: statusColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    appointment.status,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "${monthList[appointment.date.month - 1]} ${formatTime(appointment.date.day)}, ${appointment.date.year} | ${formatTime(appointment.date.hour)}:${formatTime(appointment.date.minute)}",
                        style: const TextStyle(
                          color: Color(0xFF424242),
                          fontSize: 12,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: CircleAvatar(
                    radius: screenWidth * 0.06,
                    backgroundColor: const Color(0x14246BFD),
                    child: appointment.contactImage,
                  ),
                )
              ],
            ),
            if (appointment.status == "Completed") ...{
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04 * screenWidth),
                child: Divider(
                  thickness: 2.5,
                  color: Colors.grey[200],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        color: Color(0xFF246BFD),
                        width: 2,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.09 * screenWidth),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Book Again",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF246BFD),
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0.10,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF246BFD),
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.08 * screenWidth),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Review(
                            appointment: appointment,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Leave a Review",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0.10,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            }
          ],
        ),
      ),
    );
  }
}

class DoctorCard2 extends StatelessWidget {
  final DoctorAppointment appointment;

  const DoctorCard2({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            CustomShadow.shadow,
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
              child: Image(image: appointment.doctorImage.image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.doctorName,
                  style: const TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14, right: 8),
                  child: SizedBox(
                    width: 200,
                    height: 2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffEEEEEE),
                      ),
                    ),
                  ),
                ),
                Text(
                  appointment.type,
                  style: const TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  appointment.location,
                  style: const TextStyle(
                    color: Color(0xFF424242),
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
