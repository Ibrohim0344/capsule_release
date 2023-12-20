import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptySection extends StatelessWidget {
  const EmptySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: Text(""),
        ),
        SvgPicture.asset("assets/images/frame.svg"),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "You don't have an appointment yet",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "You don't have a doctor's appointment scheduled at the moment.",
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Urbanist",
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
        const Expanded(
          flex: 2,
          child: Text(""),
        ),
      ],
    );
  }
}