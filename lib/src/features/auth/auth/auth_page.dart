import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../common/constants/app_colors.dart';
import '../user_auth/sign_in/sign_in_page.dart';
import '../user_auth/sign_up/sign_up_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/images/auth.svg"),
              Text(
                "Let's sign in",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(size.height * 0.02),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: size.height * 0.068,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/google.svg"),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              "Continue with Google",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.018),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(size.height * 0.02),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: size.height * 0.068,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/apple.svg"),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              "Continue with Apple",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.027),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColoredBox(
                        color: const Color(0xFF727273),
                        child: SizedBox(
                          height: 1,
                          width: size.width * 0.36,
                        ),
                      ),
                      Text(
                        "or",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      ColoredBox(
                        color: const Color(0xFF727273),
                        child: SizedBox(
                          height: 1,
                          width: size.width * 0.36,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.027),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserSignIn(),
                          ));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(
                        double.infinity,
                        size.height * 0.068,
                      ),
                    ),
                    child: Text(
                      "Sign in with phone number",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF9E9E9E),
                  ),
                  children: [
                    const TextSpan(text: "Don’t have an account?  "),
                    WidgetSpan(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserSignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
