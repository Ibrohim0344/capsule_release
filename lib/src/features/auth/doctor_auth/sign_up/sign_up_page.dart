import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/services/sms_service.dart';
import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/context_utils.dart';
import '../sign_in/sign_in_page.dart';

class DoctorSignUp extends StatefulWidget {
  const DoctorSignUp({super.key});

  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  late TextEditingController textEditingController;
  late TextEditingController tokenEditingController;
  late TextEditingController nameEditingController;
  late TextEditingController passwordEditingController;
  final smsCode = SmsService();
  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeToken = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    tokenEditingController = TextEditingController();
    nameEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    tokenEditingController.dispose();
    nameEditingController.dispose();
    passwordEditingController.dispose();
    focusNodePhone.dispose();
    focusNodePassword.dispose();
    focusNodeName.dispose();
    focusNodeToken.dispose();
    super.dispose();
  }

  void onTap() {
    focusNodeToken.unfocus();
    focusNodeName.unfocus();
    focusNodePassword.unfocus();
    focusNodePhone.requestFocus();
    // if (!textEditingController.text.startsWith("+998")) {
    //   textEditingController.text = "+998 ${textEditingController.text}";
    // }
  }

  String? validateToken(String? value) {
    if (value != null && value.length < 8) {
      return "Token is incorrect";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null) {
      return "Name is incorrect";
    }
    return null;
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

  String? validatePassword(String? value) {
    if (value != null) {
      if (value.trim().length < 4) {
        return "Password incorrect";
      }
      return null;
    }
    return "Password incorrect";
  }

  void validate() async {
    if (formKey.currentState!.validate()) {
      smsCode.phoneAuthDoctor(
        "+998 ${textEditingController.text}",
        context,
        nameEditingController.text,
        passwordEditingController.text,
        tokenEditingController.text,
      );
      $currentUser.getUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);
    ValueNotifier<bool> lock = ValueNotifier<bool>(true);
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
                SizedBox(height: size.height * .07),
                SvgPicture.asset("assets/images/SignInLogo.svg"),
                SizedBox(height: size.height * 0.01),
                Text(
                  "Welcome Doctor",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                TextFormField(
                  onTap: () {
                    focusNodePhone.unfocus();
                    focusNodeName.unfocus();
                    focusNodePassword.unfocus();
                    focusNodeToken.requestFocus();
                  },
                  validator: validateToken,
                  controller: tokenEditingController,
                  focusNode: focusNodeToken,
                  onTapOutside: (event) => focusNodeToken.unfocus(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Your token",
                    filled: true,
                    fillColor: AppColors.textField,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: AppColors.black1Color,
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
                TextFormField(
                  onTap: () {
                    focusNodePhone.unfocus();
                    focusNodeToken.unfocus();
                    focusNodePassword.unfocus();
                    focusNodeName.requestFocus();
                  },
                  validator: validateName,
                  focusNode: focusNodeName,
                  controller: nameEditingController,
                  onTapOutside: (event) => focusNodeName.unfocus(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Your name",
                    filled: true,
                    fillColor: AppColors.textField,
                    prefixIcon: const Icon(
                      Icons.account_circle_sharp,
                      color: AppColors.black1Color,
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
                SizedBox(height: size.height * 0.01),
                ValueListenableBuilder(
                    valueListenable: lock,
                    builder: (context, value, child) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: TextFormField(
                          onTap: () {
                            focusNodePhone.unfocus();
                            focusNodeName.unfocus();
                            focusNodeToken.unfocus();
                            focusNodePassword.requestFocus();
                          },
                          validator: validatePassword,
                          focusNode: focusNodePassword,
                          controller: passwordEditingController,
                          onTapOutside: (event) => focusNodePassword.unfocus(),
                          obscuringCharacter: "•",
                          obscureText: lock.value,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => lock.value = !lock.value,
                              icon: Icon(
                                lock.value
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: "Password",
                            filled: true,
                            fillColor: AppColors.textField,
                            prefixIcon: const Icon(Icons.lock,
                                color: AppColors.black1Color),
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
                      );
                    }),
                SizedBox(height: size.height * 0.01),
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
                            style:
                                const TextStyle(color: AppColors.black1Color),
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
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: AppColors.askAcc,
                      ),
                      children: [
                        const TextSpan(text: "You don’t doctor?  "),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DoctorSignIn(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign in",
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
                SizedBox(height: size.height * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
