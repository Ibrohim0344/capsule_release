import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/services/sms_service.dart';
import '../../../../common/utils/context_utils.dart';
import '../../doctor_auth/sign_in/sign_in_page.dart';
import '../sign_up/sign_up_page.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  late TextEditingController textEditingController;
  final smsCode = SmsService();
  FocusNode focusNodePhone = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNodePhone.dispose();
    super.dispose();
  }

  void onTap() {
    focusNodePhone.requestFocus();
    // if (!textEditingController.text.startsWith("+998")) {
    //   textEditingController.text = "+998 ${textEditingController.text}";
    // }
  }

  String? validatePhone(String? value) {
    if (value != null) {
      if (value.trim().length != 9) {
        return "Phone number incorrect";
      }
      return null;
    }
    return "Phone number incorrect";
  }

  void validate() async {
    if (formKey.currentState!.validate()) {
      smsCode.phoneAuthUser(
        textEditingController.text,
        context,
        "",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.07),
                SvgPicture.asset("assets/images/SignInLogo.svg"),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Sign in with phone\nnumber",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  onTap: onTap,
                  validator: validatePhone,
                  controller: textEditingController,
                  focusNode: focusNodePhone,
                  onTapOutside: (event) => focusNodePhone.unfocus(),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  cursorColor: AppColors.blue,
                  maxLength: 9,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    counter: const SizedBox.shrink(),
                    filled: true,
                    fillColor: AppColors.textField,
                    prefixIcon: SizedBox(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: AppColors.black1Color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1.2),
                            child: Text(
                              "+998",
                              style: context.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * 0.033),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * 0.033),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(size.width * 0.033),
                      ),
                      borderSide: const BorderSide(
                        color: AppColors.red,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: valueNotifier,
                          builder: (context, value, child) {
                            return Checkbox(
                              activeColor: AppColors.blue,
                              value: valueNotifier.value,
                              onChanged: (value) =>
                                  valueNotifier.value = !valueNotifier.value,
                            );
                          },
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: AppColors.black1Color,
                            ),
                            children: [
                              const TextSpan(text: "I agree to the terms of "),
                              TextSpan(
                                text: "use",
                                onEnter: (event) {},
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.018),
                    FilledButton(
                      onPressed: validate,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        minimumSize: Size(
                          double.infinity,
                          size.height * 0.068,
                        ),
                      ),
                      child: Text(
                        "Send code",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.018),
                    FilledButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorSignIn(),
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        minimumSize: Size(
                          double.infinity,
                          size.height * 0.068,
                        ),
                        backgroundColor: AppColors.whiteColor,
                        side: const BorderSide(
                          width: 1,
                          color: AppColors.blue,
                        ),
                      ),
                      child: Text(
                        "as Doctor",
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.askAcc,
                      ),
                      children: [
                        const TextSpan(text: "You don’t have a account?  "),
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
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
