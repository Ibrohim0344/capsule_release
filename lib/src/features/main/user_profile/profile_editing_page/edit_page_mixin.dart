import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/services/storage/storage.dart';
import '../widgets/custom_button.dart';
import 'edit_page.dart';

mixin EditPageMixin on State<EditPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

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
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    birthdayController = TextEditingController();
    firstNameController.text = $currentUser.currentUser!.name;
    lastNameController.text = $currentUser.currentUser!.lastName;
    birthdayController.text =
        $currentUser.currentUser!.dateOfBirth.toIso8601String();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    birthdayController.dispose();
  }

  void dialog() {
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 250),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          $currentUser.currentUser!.dateOfBirth = newDate;
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
                          birthdayController.text =
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
