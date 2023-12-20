
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_list_tile.dart';
import 'mixin.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> with InviteFriendsMixin {
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
