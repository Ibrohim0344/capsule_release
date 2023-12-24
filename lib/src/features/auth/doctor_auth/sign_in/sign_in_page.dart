import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/data/repository/doctor_repository.dart';
import '../../../../common/services/doctor_auth_service.dart';
import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../main/main_page.dart';
import '../sign_up/sign_up_page.dart';

class DoctorSignIn extends StatefulWidget {
  const DoctorSignIn({super.key});

  @override
  State<DoctorSignIn> createState() => _DoctorSignInState();
}

class _DoctorSignInState extends State<DoctorSignIn> {
  late TextEditingController textEditingController;
  late TextEditingController passwordEditingController;
  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  late IDoctorRepository repository;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    repository = DoctorRepository();
    passwordEditingController = TextEditingController();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    passwordEditingController.dispose();
    focusNodePhone.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  void onTap() {
    focusNodePassword.unfocus();
    focusNodePhone.requestFocus();
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
      final login=await DoctorAuthService.login(textEditingController.text);
      if(mounted && login){
        $currentUser.getUser();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);
    ValueNotifier<bool> lock = ValueNotifier<bool>(false);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * .07),
                SvgPicture.asset("assets/images/SignInLogo.svg"),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Log in as Doctor",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  validator: validatePhone,
                  controller: textEditingController,
                  focusNode: focusNodePhone,
                  onTap: onTap,
                  onTapOutside: (event) => focusNodePhone.unfocus(),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  cursorColor: AppColors.blue,
                  maxLength: 9,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
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
                    counter: const SizedBox.shrink(),
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
                SizedBox(height: size.height * 0.03),
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
                          focusNodePassword.requestFocus();
                        },
                        controller: passwordEditingController,
                        validator: validatePassword,
                        focusNode: focusNodePassword,
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
                          prefixIcon: const Icon(
                            Icons.lock,
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
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
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
                        const Text(
                          "Remember me",
                          style: TextStyle(color: AppColors.black1Color),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
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
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: AppColors.askAcc),
                      children: [
                        const TextSpan(text: "You don’t have a account?  "),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DoctorSignUp(),
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
                SizedBox(height: size.height * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
