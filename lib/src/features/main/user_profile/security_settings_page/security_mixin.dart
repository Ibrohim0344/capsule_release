import 'package:flutter/material.dart';

import 'security_settings.dart';

mixin SecurityMixin on State<SecurityPage> {
  List<String> security = [
    "Remember me",
    "Face ID",
    "Biometric ID",
  ];

  List<bool> securityValue = List.generate(3, (index) => false);
}
