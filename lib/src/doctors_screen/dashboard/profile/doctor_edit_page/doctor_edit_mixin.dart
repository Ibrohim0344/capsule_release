import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/services/storage/storage.dart';
import '../../../../features/main/user_profile/widgets/custom_button.dart';
import 'doctor_edit_page.dart';


mixin DoctorEditMixin on State<DoctorEditPage>{
  TextEditingController doctorFirstNameController = TextEditingController();
  TextEditingController doctorLastNameController = TextEditingController();
  TextEditingController doctorBirthdayController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        /// current userni image ga _image ni qo'shib ketish kerak
      }
    });
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        /// current userni image ga _image ni qo'shib ketish kerak
      }
    });
  }

  @override
  void initState() {
    doctorFirstNameController = TextEditingController();
    doctorLastNameController = TextEditingController();
    doctorBirthdayController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    doctorFirstNameController.dispose();
    doctorLastNameController.dispose();
    doctorBirthdayController.dispose();
  }

  void dialog(){
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50.0, vertical: 250),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          $currentUser.currentUser!.dateOfBirth =
                              newDate;
                        });
                      },
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onPressed: () {
                          doctorBirthdayController.text =
                          "${$currentUser.currentUser!.dateOfBirth}";
                          Navigator.pop(context);
                        },
                        text: "Ok",
                        color: const Color(0xFFE9F0FF),
                        textColor: const Color(0xFF246BFD),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomButton(
                        onPressed: () => Navigator.pop(context),
                        text: "Cancel",
                        color: const Color(0xFFE9F0FF),
                        textColor: const Color(0xFF246BFD),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }
}