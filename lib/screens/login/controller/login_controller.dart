import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppers/app.dart';
import 'package:shoppers/screens/Products/product.dart';

class LoginController extends GetxController{

  //Sign up
  GlobalKey<FormState> signupInfoKey = GlobalKey<FormState>();
  TextEditingController signUpName = new TextEditingController();
  TextEditingController signUpEmail = new TextEditingController();
  TextEditingController signUpNumber = new TextEditingController();
  TextEditingController signUpPassword = new TextEditingController();
  TextEditingController signUpConfirmPassword = new TextEditingController();


  void signUpMethod(){
    getStorage.write('isLogin', 'true');
    Get.offAll(()=> Home());
  }
}