import 'package:flutter/material.dart';

import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../auth/user_auth/sign_in/sign_in_page.dart';
import 'custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      child: SizedBox(
        height: size.height * 0.3,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Divider(
                endIndent: size.width * 0.44,
                indent: size.width * 0.44,
                thickness: 3,
              ),
              Text(
                "Log Out",
                style: context.textTheme.titleLarge?.copyWith(
                  color: const Color(0xFFF75555),
                  fontWeight: FontWeight.w800,
                ),
              ),
              Divider(
                endIndent: size.width * 0.043,
                indent: size.width * 0.043,
                thickness: 1,
              ),
              Text(
                "Are you sure you want to log out?",
                style: context.textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    onPressed: () {},
                    color: const Color(0xFFE9F0FF),
                    text: "Cancel",
                    textColor: const Color(0xFF246BFD),
                    size: const Size(160, 50),
                  ),
                  CustomButton(
                    onPressed: () {
                      $currentUser.logOutUser();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const UserSignIn(),
                          ),
                          (route) => false);
                    },
                    color: const Color(0xFF246BFD),
                    text: "Yes, Log Out",
                    size: const Size(160, 50),
                    elevation: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
