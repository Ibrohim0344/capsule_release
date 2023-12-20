import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/app_icons.dart';
import '../../../common/utils/context_utils.dart';
import '../../../features/main/user_profile/security_settings_page/security_settings.dart';
import '../../../features/main/user_profile/widgets/bottom_sheet.dart';
import '../../../features/main/user_profile/widgets/custom_list_tile.dart';
import '../../../features/main/user_profile/widgets/custom_switch.dart';
import 'doctor_edit_page/doctor_edit_page.dart';
import 'doctor_invite_friends_page/doctor_invite_friends_page.dart';
import 'doctor_language_page/doctor_language_page.dart';
import 'doctor_notification_setting_page/doctor_notification_setting_page.dart';

class DoctorsProfile extends StatefulWidget {
  const DoctorsProfile({super.key});

  @override
  State<DoctorsProfile> createState() => _DoctorsProfileState();
}

class _DoctorsProfileState extends State<DoctorsProfile> {
  bool darkMode = true;

  void openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: size.width * 0.2,
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.022,
                ),
                Center(
                  child: Text(
                    "Hello",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF212121),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Center(
                  child: Text(
                    "ascad",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF212121),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    height: 5,
                    endIndent: 5,
                    thickness: 1,
                  ),
                ),
                CustomListTile(
                  title: "Edit Your Profile",
                  leading: SvgPicture.asset(AppIcons.editProfile),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => openPage(
                    const DoctorEditPage(),
                  ),
                ),
                CustomListTile(
                  title: "Edit Your Company",
                  leading: SvgPicture.asset(AppIcons.editProfile),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                CustomListTile(
                  title: "Notification Settings",
                  leading: SvgPicture.asset(AppIcons.notification),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => openPage(
                    const DoctorNotificationSettingPage(),
                  ),
                ),
                CustomListTile(
                  title: "Security",
                  leading: SvgPicture.asset(AppIcons.security),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => openPage(
                    const SecurityPage(),
                  ),
                ),
                CustomListTile(
                  title: "Language",
                  leading: SvgPicture.asset(AppIcons.language),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => openPage(
                    const DoctorLanguagePage(),
                  ),
                ),
                CustomListTile(
                  title: "Dark Mode",
                  leading: SvgPicture.asset(AppIcons.eye),
                  onTap: () {
                    setState(() {
                      darkMode = !darkMode;
                    });
                  },
                  trailing: CustomSwitch(
                    value: darkMode,
                    onChanged: (bool value) {
                      setState(() {
                        darkMode = value;
                      });
                    },
                  ),
                ),
                CustomListTile(
                  onTap: () => openPage(
                    const DoctorInviteFriendsPage(),
                  ),
                  title: "Invite Friends",
                  leading: SvgPicture.asset(AppIcons.friends),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                ),
                CustomListTile(
                  title: "About us",
                  leading: SvgPicture.asset(AppIcons.about),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                ),
                CustomListTile(
                  title: "Log Out",
                  leading: SvgPicture.asset(AppIcons.logout),
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomBottomSheet();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
