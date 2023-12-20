import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/custom_switch.dart';
import 'notification_mixin.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationSettingPage> with NotificationMixin{

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
