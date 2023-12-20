import 'package:flutter/material.dart';

import '../../../../features/main/user_profile/widgets/custom_app_bar.dart';
import '../../../../features/main/user_profile/widgets/custom_button.dart';
import '../../../../features/main/user_profile/widgets/custom_list_tile.dart';
import 'doctor_invite_page_mixin.dart';

class DoctorInviteFriendsPage extends StatefulWidget {
  const DoctorInviteFriendsPage({super.key});

  @override
  State<DoctorInviteFriendsPage> createState() => _DoctorInviteFriendsPageState();
}

class _DoctorInviteFriendsPageState extends State<DoctorInviteFriendsPage> with DoctorInviteFriendsMixin {
  @override
  void initState() {
    super.initState();
    n();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: const CustomAppBar(
          title: "Invite Friends",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ListView(
            children: List.generate(
              names.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CustomListTile(
                  title: names[index],
                  subtitle: numbers[index],
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(
                      images[index],
                    ),
                    radius: 30,
                  ),
                  trailing: CustomButton(
                    onPressed: () => onPressed(index),
                    text: invite[index] ? "Invited" : "Invite",
                    textColor:
                    invite[index] ? const Color(0xFF246BFD) : Colors.white,
                    color: invite[index] ? Colors.white : const Color(0xFF246BFD),
                    side: invite[index]
                        ? const BorderSide(
                      width: 2,
                      color: Color(0xFF246BFD),
                    )
                        : BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
