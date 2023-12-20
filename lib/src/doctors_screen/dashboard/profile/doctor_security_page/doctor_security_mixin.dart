import 'package:flutter/material.dart';

import 'doctor_security_page.dart';

mixin DoctorSecurityMixin on State<DoctorSecurityPage> {
  List<String> security = [
    "Remember me",
    "Face ID",
    "Biometric ID",
  ];

  List<bool> securityValue = List.generate(3, (index) => false);
}
