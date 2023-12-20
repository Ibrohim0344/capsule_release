import 'package:flutter/material.dart';

import '../../../../features/main/user_profile/widgets/custom_app_bar.dart';
import '../../../../features/main/user_profile/widgets/custom_list_tile.dart';
import '../../../../features/main/user_profile/widgets/custom_switch.dart';
import 'doctor_notification_setting_mixin.dart';

class DoctorNotificationSettingPage extends StatefulWidget {
  const DoctorNotificationSettingPage({super.key});

  @override
  State<DoctorNotificationSettingPage> createState() => _DoctorNotificationPageState();
}

class _DoctorNotificationPageState extends State<DoctorNotificationSettingPage> with DoctorNotificationMixin{

  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.08),
        child: const CustomAppBar(
          title: "Notification",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: List.generate(
              values.length,
                  (index) => CustomListTile(
                title: notification[index],
                titleSize: 20,
                onTap: () {
                  setState(() {
                    values[index] = !values[index];
                  });
                },
                trailing: CustomSwitch(
                  value: values[index],
                  onChanged: (bool value) {
                    setState(() {
                      values[index] = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
