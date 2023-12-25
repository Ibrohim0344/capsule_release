import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../features/main/user_profile/widgets/custom_app_bar.dart';
import '../../../../features/main/user_profile/widgets/custom_button.dart';
import '../../../../features/main/user_profile/widgets/custom_text_field.dart';
import 'doctor_edit_mixin.dart';

class DoctorEditPage extends StatefulWidget {
  const DoctorEditPage({super.key});

  @override
  State<DoctorEditPage> createState() => _DoctorEditPageState();
}

class _DoctorEditPageState extends State<DoctorEditPage> with DoctorEditMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: CustomAppBar(
          title: "Edit Profile",
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                // onTap: () {
                //   UserModel updatedUser = $currentUser.currentUser!.copyWith(
                //     name: doctorFirstNameController.text,
                //     lastName: doctorLastNameController.text,
                //   );
                //   $currentUser.updateUser(
                //     updatedUser,
                //     $currentUser.currentUser!.id,
                //   );
                //   Navigator.pop(context);
                // },
                child: const Icon(
                  Icons.done,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: ListView(
            children: [
              Stack(
                alignment: const Alignment(.4, .9),
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: size.width * 0.15,
                      //   backgroundImage: _image!=null?FileImage(_image): AssetImage("assets/images/user.png"),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(.28, .7),
                    child: SizedBox(
                      height: size.width * 0.085,
                      width: size.width * 0.085,
                      child: GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (
                            BuildContext context,
                          ) {
                            return DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(35),
                                ),
                              ),
                              child: SizedBox(
                                height: size.height * 0.25,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomButton(
                                        onPressed: getImageFromCamera,
                                        size: Size(
                                          size.width * 0.85,
                                          size.height * 0.065,
                                        ),
                                        color: const Color(0xFFE9F0FF),
                                        textColor: const Color(0xFF246BFD),
                                        text: "Camera",
                                        fontSize: 20,
                                      ),
                                      CustomButton(
                                        onPressed: getImageFromGallery,
                                        size: Size(
                                          size.width * 0.85,
                                          size.height * 0.065,
                                        ),
                                        color: const Color(0xFFE9F0FF),
                                        textColor: const Color(0xFF246BFD),
                                        text: "Galery",
                                        fontSize: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        child: Card(
                          color: Colors.cyan,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: size.width * .04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "First Name",
                onTap: () {
                  // doctorFirstNameController.text = $currentUser.currentUser!.name;
                },
                controller: doctorFirstNameController,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                onTap: () {
                  //  doctorLastNameController.text = $currentUser.currentUser!.lastName;
                },
                hintText: "Last Name",
                textInputAction: TextInputAction.next,
                controller: doctorLastNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                //   controller: doctorBirthdayController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.birthday,
                  ),
                ),
                hintText: "Your Birthday",
                readOnly: true,
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                readOnly: true,
                hintText: "Your Email",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                readOnly: true,
                hintText: "Phone Number",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Select Your Fields",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Work Experience",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Add Your Documents",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Current Workplace",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Work Times",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Password",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppIcons.email,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
