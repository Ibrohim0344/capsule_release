import 'package:flutter/material.dart';

class DoctorWorkHistory extends StatelessWidget {
  const DoctorWorkHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Will be available in next updates",
          style: TextStyle(
            fontFamily: "Urbanist",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
