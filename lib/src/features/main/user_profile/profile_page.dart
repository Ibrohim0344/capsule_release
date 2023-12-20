import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constants/app_icons.dart';
import '../../../common/services/storage/storage.dart';
import '../../../common/utils/context_utils.dart';
import 'invite_friends_page/invite_page.dart';
import 'language_settings_page/language_settings.dart';
import 'notification_settings_page/notifications_settings.dart';
import 'profile_editing_page/edit_page.dart';
import 'security_settings_page/security_settings.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/custom_list_tile.dart';
import 'widgets/custom_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        leading: const SizedBox.shrink(),
        leadingWidth: 10,
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
                    "${$currentUser.currentUser!.name} ${$currentUser.currentUser!.lastName}",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF212121),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Center(
                  child: Text(
                    $currentUser.currentUser!.phoneNumber,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF212121),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
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
                  title: "Edit Profile",
                  leading: SvgPicture.asset(AppIcons.editProfile),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => openPage(
                    const EditPage(),
                  ),
                ),
                CustomListTile(
                  title: "Notification Settings",
                  leading: SvgPicture.asset(AppIcons.notification),
                  trailing: const Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black,
                  ),
                  onTap: () => openPage(
                    const NotificationSettingPage(),
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
                    const LanguagePage(),
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
                  onTap: () => openPage(const InvitePage()),
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
