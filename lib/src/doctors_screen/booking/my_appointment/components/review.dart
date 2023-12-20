import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../doctors_main_page.dart';
import '../model/doctor_appointment_model.dart';

class Review extends StatefulWidget {
  final DoctorAppointment appointment;

  const Review({required this.appointment, super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  double rating = 0;
  bool recommend = true;
  final TextEditingController reviewController = TextEditingController();

  Future<void> _showSubmitDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: const Color(0xffffffff),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SvgPicture.asset("assets/images/success.svg"),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(height: 15),
                Text(
                  "Review Successful!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF246BFD),
                    fontSize: 24,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Your review has been successfully submitted, thank you very much!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.20,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF246BFD),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsMainPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 17),
                  child: Text(
                    "OK",
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
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: const BackButton(),
        title: const Text(
          "Write a Review",
          style: TextStyle(
            color: Color(0xFF212121),
            fontSize: 24,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            CircleAvatar(
              foregroundImage: widget.appointment.doctorImage.image,
              radius: 80,
            ),
            Text(
              "How was your experience\nwith ${widget.appointment.doctorName}?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF212121),
                fontSize: 20,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 22),
            RatingBar(
              glowColor: Colors.white38,
              initialRating: rating,
              unratedColor: Colors.blue.withOpacity(0.2),
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star_rounded, color: Color(0xFF246BFD)),
                half: const Icon(Icons.star_half, color: Color(0xFF246BFD)),
                empty:
                    const Icon(Icons.star_border_rounded, color: Color(0xFF246BFD)),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 27),
              child: Divider(
                color: Colors.grey[300],
                height: 3,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 175.0),
              child: Text(
                "Write Your Review",
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: reviewController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your review here...',
                  hintStyle: TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Would you recommend ${widget.appointment.doctorName} to your friends?",
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: true,
                    groupValue: recommend,
                    activeColor: const Color(0xFF246BFD),
                    onChanged: (value) {
                      setState(() {
                        recommend = value as bool;
                      });
                    },
                  ),
                  const Text(
                    "Yes",
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.20,
                    ),
                  ),
                  Radio(
                    value: false,
                    groupValue: recommend,
                    activeColor: const Color(0xFF246BFD),
                    onChanged: (value) {
                      setState(() {
                        recommend = value as bool;
                      });
                    },
                  ),
                  const Text(
                    "No",
                    style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      surfaceTintColor: const Color(0xFFE9F0FF),
                      backgroundColor: const Color(0xFFE9F0FF),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 28.0, horizontal: 30),
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF246BFD),
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: const Color(0xFF3061C7),
                      elevation: 3,
                      backgroundColor: const Color(0xFF246BFD),
                      shadowColor: const Color(0xFF246BFD),
                    ),
                    onPressed: _showSubmitDialog,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 28.0, horizontal: 30),
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
