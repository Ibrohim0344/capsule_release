import 'package:flutter/material.dart';

import 'doctor_notification_setting_page.dart';

mixin DoctorNotificationMixin on State<DoctorNotificationSettingPage> {
  List<String> notification = [
    "General Notification",
    "Sound",
    "Vibrate",
    "Special Offers",
    "Promo & Discount",
    "Payments",
    "Cashback",
    "App Updates",
    "New Service Available",
    "New Tips Available",
  ];

  List<bool> values = List.generate(10, (index) => false);
}
