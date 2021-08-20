import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers/config/colors.dart';
import 'package:shoppers/screens/login/login.dart';
import 'package:shoppers/utils/popups.dart';
import 'package:shoppers/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: loginController.signupInfoKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: Get.height - MediaQuery.of(context).padding.top,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  AppText.appText(
                    text: 'Signup',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AppText.appText(
                    text: 'Please fill information below to continue.',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColors.blackColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  appTextFormField(
                      horizontal: 0,
                      vertical: 6,
                      needValidation: true,
                      hintText: "Name",
                      validationMessage: 'Name'),
                  appTextFormField(
                    controller: loginController.signUpEmail,
                    horizontal: 0,
                    vertical: 6,
                    needValidation: true,
                    hintText: 'Enter Email',
                    validationMessage: 'Email',
                  ),
                  appTextFormField(
                    controller: loginController.signUpNumber,
                    horizontal: 0,
                    vertical: 6,
                    maxLength: 10,
                    needValidation: true,
                    isNumberValidator: true,
                    hintText: 'Enter Mobile Number',
                    validationMessage: 'Mobile Number',
                  ),
                  appTextFormField(
                    controller: loginController.signUpPassword,
                    horizontal: 0,
                    keyboardType: TextInputType.visiblePassword,
                    vertical: 6,
                    hintText: 'Password',
                    obscureText: true,
                    isPasswordValidator: true,
                    needValidation: true,
                    validationMessage: 'Password',
                  ),
                  appTextFormField(
                    controller: loginController.signUpConfirmPassword,
                    horizontal: 0,
                    vertical: 6,
                    keyboardType: TextInputType.visiblePassword,
                    needValidation: true,
                    isPasswordValidator: true,
                    obscureText: true,
                    hintText: 'Confirm Password',
                    validationMessage: 'Password Confirmation',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  appButton(
                    horizontal: 0,
                    vertical: 0,
                    title: 'Welcome',
                    onTap: () {
                      if (loginController.signupInfoKey.currentState!
                              .validate() ==
                          true) {
                        if (loginController.signUpPassword.text ==
                            loginController.signUpConfirmPassword.text) {
                          loginController.signUpNumber.clear();
                          loginController.signUpName.clear();
                          loginController.signUpEmail.clear();
                          loginController.signUpConfirmPassword.clear();
                          loginController.signUpPassword.clear();
                          loginController.signUpMethod();
                        } else {
                          CommonPopup.showSnackbar(
                              message: 'Password does not match!');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
