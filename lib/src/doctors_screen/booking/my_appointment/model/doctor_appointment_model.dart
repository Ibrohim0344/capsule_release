import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorAppointment {
  final String doctorName;
  final String contactType;
  final String status;
  final DateTime date;
  final Image doctorImage;
  final SvgPicture contactImage;
  final String location;
  final String type;

  DoctorAppointment({
    required this.doctorName,
    required this.contactType,
    required this.status,
    required this.date,
    required this.doctorImage,
    required this.contactImage,
    required this.location,
    required this.type,
  });
}