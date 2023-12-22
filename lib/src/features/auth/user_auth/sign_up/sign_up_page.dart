import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/constants/app_colors.dart';
import '../../../../common/services/database_service.dart';
import '../../../../common/services/storage/storage.dart';
import '../../../../common/utils/context_utils.dart';
import '../../../main/main_page.dart';
import '../../doctor_auth/sign_in/sign_in_page.dart';
import '../sign_in/sign_in_page.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  late TextEditingController textEditingController;
  late TextEditingController nameEditingController;
  final auth = DataBaseService();
  FocusNode focusNodePhone = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeName = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    nameEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    nameEditingController.dispose();
    focusNodePhone.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
  }

  void onTap() {
    focusNodeEmail.unfocus();
    focusNodeName.unfocus();
    focusNodePhone.requestFocus();
  }

  String? validateName(String? value) {
    if (value == null) {
      return "Token is incorrect";
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

  void validate() async {
    if (formKey.currentState!.validate()) {
      auth.storeUser(
        nameEditingController.text,
        textEditingController.text,
        textEditingController.text,
      );
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
                Text(
                  "Create new Account",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: TextFormField(
                        onTap: () {
                          focusNodeEmail.unfocus();
                          focusNodePhone.unfocus();
                          focusNodeName.requestFocus();
                        },
                        focusNode: focusNodeName,
                        validator: validateName,
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
                    ),
                    const SizedBox(height: 2),
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
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
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
                                  onChanged: (value) => valueNotifier.value =
                                      !valueNotifier.value,
                                );
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.black1Color,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "I agree to the terms of ",
                                  ),
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.02,
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
                            backgroundColor: Colors.white,
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
                    SizedBox(height: size.height * .03),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: AppColors.askAcc),
                          children: [
                            const TextSpan(text: "Already have an account?  "),
                            WidgetSpan(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UserSignIn(),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
