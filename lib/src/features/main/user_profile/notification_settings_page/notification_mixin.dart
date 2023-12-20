import 'package:flutter/material.dart';

import 'notifications_settings.dart';

mixin NotificationMixin on State<NotificationSettingPage> {
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
