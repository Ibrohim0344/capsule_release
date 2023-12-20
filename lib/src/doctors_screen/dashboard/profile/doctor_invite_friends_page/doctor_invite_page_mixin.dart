import 'package:flutter/material.dart';

import 'doctor_invite_friends_page.dart';


mixin DoctorInviteFriendsMixin on State<DoctorInviteFriendsPage> {
  List images = [
    "assets/images/person/Ellipse.png",
    "assets/images/person/Ellipse (1).png",
    "assets/images/person/Ellipse (2).png",
    "assets/images/person/Ellipse (3).png",
    "assets/images/person/Ellipse (4).png",
    "assets/images/person/Ellipse (5).png",
    "assets/images/person/Ellipse (6).png",
    "assets/images/person/Ellipse (6).png",
    "assets/images/person/Type=Default, Component=Avatar.png",
    "assets/images/person/Ellipse.png",
    "assets/images/person/Ellipse (1).png",
    "assets/images/person/Ellipse (2).png",
    "assets/images/person/Ellipse (3).png",
    "assets/images/person/Ellipse (4).png",
    "assets/images/person/Ellipse (5).png",
    "assets/images/person/Ellipse (6).png",
    "assets/images/person/Ellipse (6).png",
    "assets/images/person/Type=Default, Component=Avatar.png",
  ];

  List<String> names = [
    "Lauralee Quintero",
    "Annabel Rohan",
    "Alfonzo Schuessler",
    "Augustina Midgett",
    "Freida Varnes",
    "Francene Vandyne",
    "Geoffrey Mott",
    "Rayford Chenail",
    "Florencio Dorrance",
    "Lauralee Quintero",
    "Annabel Rohan",
    "Alfonzo Schuessler",
    "Augustina Midgett",
    "Freida Varnes",
    "Francene Vandyne",
    "Geoffrey Mott",
    "Rayford Chenail",
    "Florencio Dorrance",
  ];

  List<String> numbers = [
    "+1-300-555-0135",
    "+1-202-555-0136",
    "+1-300-555-0119",
    "+1-300-555-0161",
    "+1-300-555-0136",
    "+1-202-555-0167",
    "+1-202-555-0119",
    "+1-202-555-0171",
    "+1-300-555-0171",
    "+1-300-555-0135",
    "+1-202-555-0136",
    "+1-300-555-0119",
    "+1-300-555-0161",
    "+1-300-555-0136",
    "+1-202-555-0167",
    "+1-202-555-0119",
    "+1-202-555-0171",
    "+1-300-555-0171",
  ];

  List<bool> invite = [];

  void n() => invite = List.generate(numbers.length, (index) => false);

  void onPressed(int index) {
    setState(() {
      for (int i = 0; i < invite.length; i++) {
        if (i == index) invite[i] = !invite[i];
      }
    });
  }
}
